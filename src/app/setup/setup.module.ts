import { NgModule, ModuleWithProviders, APP_INITIALIZER, ErrorHandler } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SetupComponent } from './setup.component';
import { TaxRatesComponent } from './tax-rates/tax-rates.component';
import { SetupRoutingModule } from './setup-routing.module';
import { DetailsModule } from '../details/details.module';
import { MaterialModule } from '../material/material.module';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { UiModule } from '../common/core/ui/ui.module';
import { HttpClientModule } from '@angular/common/http';
import { HttpModule } from '../common/core/http/http.module';
import { CurrentUser } from '../common/auth/current-user';
import { HttpErrorHandler } from '../common/core/http/errors/http-error-handler.service';
import { BackendHttpErrorHandler } from '../common/core/http/errors/backend-http-error-handler.service';
import { ravenErrorHandlerFactory } from '../common/core/errors/raven-error-handler';
import { BootstrapperSetUp, init_app } from './bootstrapper.service';
import { SetUpModelService } from './setup-model.service';
import { ApiTaxRateService } from './tax-rates/api/api.service';
import { NoEntryFoundSetUpComponent } from './messages/no-entry-found/no-entry-found.component';
import { ReasonComponent } from './reasons/reason.component';
import { ApiReasonService } from './reasons/api/api.service';
import { CustomerTypeComponent, RemoveCustomertypeDialog } from './customerType/customertype.component';
import { ApiCustomerTypeService } from './customerType/api/api.service';
import { ExpirationSettingComponent } from './expiration_setting/expiration_setting.component';
import { ApiExpirationSettingService } from './expiration_setting/api/api.service';

@NgModule({
  declarations: [ReasonComponent,SetupComponent, TaxRatesComponent,NoEntryFoundSetUpComponent,CustomerTypeComponent,ExpirationSettingComponent,RemoveCustomertypeDialog],
  exports: [ReasonComponent,SetupComponent, TaxRatesComponent,ExpirationSettingComponent,NoEntryFoundSetUpComponent,CustomerTypeComponent,RemoveCustomertypeDialog],
  imports: [
    CommonModule,
    SetupRoutingModule,
    DetailsModule,
    MaterialModule,
    FormsModule,
    UiModule,
    ReactiveFormsModule,
    HttpClientModule,
    HttpModule
  ],
  providers: [
    ApiTaxRateService,
    ApiReasonService,
    ApiCustomerTypeService,
    ApiExpirationSettingService
  ],
  entryComponents: [RemoveCustomertypeDialog]
})
export class SetupModule {
  static forRoot(): ModuleWithProviders {
    return {
        ngModule: SetupModule,
        providers: [
            CurrentUser,
            BootstrapperSetUp,
            {
                provide: HttpErrorHandler,
                useClass: BackendHttpErrorHandler,
            },
            {
                provide: APP_INITIALIZER,
                useFactory: init_app,
                deps: [BootstrapperSetUp,CurrentUser],
                multi: true,
            },
            {
                provide: ErrorHandler,
                useFactory: ravenErrorHandlerFactory,
                deps: [
                  SetUpModelService,
                  ApiTaxRateService,
                  ApiReasonService,
                  ApiCustomerTypeService,
                  ApiExpirationSettingService,
                  CurrentUser],
            },
        ]
    };
}
}