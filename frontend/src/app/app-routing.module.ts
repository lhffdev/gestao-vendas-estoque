import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { FormExempleComponent } from './pages/form-exemple/form-exemple.component';
import { LayoutComponent } from './components/layout/layout.component';
import { LoginComponent } from './pages/login/login.component';


const routes: Routes = [
  { path: 'entrar', component: LoginComponent },
  {
    path: '', component: LayoutComponent, children: [
      { path: '', component: HomeComponent},
      { path: 'form-exemple', data: { title: 'Form list' }, children: [
        {path: '', component: FormExempleComponent, data: { title: 'Form Exemple' }}
      ]}
    ]
  }
]

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
