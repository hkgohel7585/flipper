import { Injectable } from '@angular/core';
import { User, Business, Tables, Menu, MenuEntries, PouchDBService, PouchConfig, Subscription } from '@enexus/flipper-components';
import { ModelService } from '@enexus/flipper-offline-database';
import { Router } from '@angular/router';
import { FlipperEventBusService } from '@enexus/flipper-event';
import { UserLoggedEvent } from './user-logged-event';
import { UserBusinessEvent } from './user-business-event';
import { UserSubscriptionEvent } from './user-subscription-event';

@Injectable({
  providedIn: 'root'
})
export class CurrentUser {
public redirectUri?: string;
public userInfo=null;
public current: MenuEntries;
currentUser: User=null;
currentBusiness: Business[]=[];
currentSubscription: Subscription=null;
   
  constructor(private eventBus: FlipperEventBusService,private model: ModelService,private database: PouchDBService,private router: Router) {
    this.database.connect(PouchConfig.bucket);
  }

  public get<K extends keyof User>(prop: K): User[K] {
    return this.currentUser && this.currentUser[prop];
  }

  
  public set(key: string, value: any): void {
    this.currentUser[key] = value;
  }

  public async user(table=null) {

   await this.database.get(table?table:PouchConfig.Tables.user).then( res=>{
    
    this.eventBus.publish(new UserLoggedEvent(res));
      
  },error=>{
      if(error.error && error.status==="404" ||  error.status===404){
        this.eventBus.publish(new UserLoggedEvent(null));
      }
  });
  
   
  }

  public async subscription() {

    await this.database.get(PouchConfig.Tables.subscription).then( res=>{
     
     this.eventBus.publish(new UserSubscriptionEvent(res));
       
   },error=>{
       if(error.error && error.status==="404" ||  error.status===404){
         this.eventBus.publish(new UserSubscriptionEvent(null));
       }
   });
   
    
   }
  
  public async business() {
    await this.database.get(PouchConfig.Tables.business).then(res=>{
    
        this.eventBus.publish(new UserBusinessEvent(res['businesses']));
      
    },error=>{
        if(error.error && error.status==="404" ||  error.status===404){
          this.eventBus.publish(new UserBusinessEvent(null));
        }
    });
    
  }

  public userLoggedIn() {
   return this.database.find(PouchConfig.Tables.user).then(res=>{
    if(res){
       return res;
    }
  });
  }

  
  public userHasBusiness() {
    return this.model.active<Business>(Tables.business);
  }

  public activeMenu() {
    return this.model.active<Menu>(Tables.menu);
  }

 

  public insertUser(user: User) {
    return this.model.create<User>(Tables.user, [user]);
  }

  public updateUser(user: User, id: number) {
    return this.model.update<User>(Tables.user, user, id);
  }



  public getRedirectUri(): string {
    let uri = null;
    uri = this.redirectUri;
    this.redirectUri = null;
    return uri;
  }

}
