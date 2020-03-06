import { Injectable } from '@angular/core';
import {
  CanActivate,
  Router,
  ActivatedRouteSnapshot,
  RouterStateSnapshot,
  CanActivateChild,
  CanLoad,
  Route
} from '@angular/router';
import { CurrentUser } from './current-user';
import { FlipperEventBusService } from '@enexus/flipper-event';
import { filter } from 'rxjs/internal/operators';
import { UserBusinessEvent } from './user-business-event';

@Injectable({
  providedIn: 'root'
})
export class HasBusinessGuard implements CanActivate, CanActivateChild, CanLoad {
  constructor(private eventBus: FlipperEventBusService,private currentUser: CurrentUser, private router: Router) {
    this.eventBus.of < UserBusinessEvent > (UserBusinessEvent.CHANNEL)
    .pipe(filter(e =>e.business && e.business.length > 0))
    .subscribe(res =>
      this.currentUser.currentBusiness = res.business);
  }

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {

    return this.handle(state.url);
  }

  canActivateChild(route: ActivatedRouteSnapshot, state: RouterStateSnapshot) {
    return this.handle(state.url);
  }
  canLoad(route: Route) {
    return this.handle(route.path);
  }

  private async handle(url: string) {

    await this.currentUser.business();
    if (this.currentUser.currentBusiness && this.currentUser.currentBusiness.length > 0) {
      return true;
    }

    this.currentUser.redirectUri = url;
    this.router.navigate(['/setup/business/new']);
    return false;
  }

}
