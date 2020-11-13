import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { MatIconRegistry, MatIconModule } from '@angular/material/icon';
import { DomSanitizer } from '@angular/platform-browser';
import { registerLocaleData } from '@angular/common';
import localePt from '@angular/common/locales/pt';
import localePtExtra from '@angular/common/locales/extra/pt';

import { AppRoutingModule } from './app-routing.module';

import { SharedModule } from './shared/shared.module';

import { AppComponent } from './app.component';
import { LayoutComponent } from './components/layout/layout.component';
import { HomeComponent } from './pages/home/home.component';
import { SidebarComponent } from './components/sidebar/sidebar.component';
import { TopbarComponent } from './components/topbar/topbar.component';
import { BreadcrumbsComponent } from './components/breadcrumbs/breadcrumbs.component';
import { FormExempleComponent } from './pages/form-exemple/form-exemple.component';
import { LoginComponent } from './pages/login/login.component';
import { BackgroundComponent } from './components/background/background.component';

registerLocaleData(localePt, 'pt-BR', localePtExtra);
@NgModule({
  declarations: [
    AppComponent,
    LayoutComponent,
    HomeComponent,
    SidebarComponent,
    TopbarComponent,
    BreadcrumbsComponent,
    FormExempleComponent,
    LoginComponent,
    BackgroundComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    MatIconModule,
    SharedModule
  ],
  exports: [
    SharedModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {

  constructor(
    matIconRegistry: MatIconRegistry,
    domSanitizer: DomSanitizer
  ) {
    matIconRegistry.addSvgIconSet(domSanitizer.bypassSecurityTrustResourceUrl('./assets/mdi.svg'));
  }

}
