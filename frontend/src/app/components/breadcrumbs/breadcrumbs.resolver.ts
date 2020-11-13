import { ActivatedRouteSnapshot, Resolve, UrlSegment } from '@angular/router';
import { Observable, of } from 'rxjs';
import { Breadcrumb } from './breadcrumb';
import { Injectable } from '@angular/core';

@Injectable()
export class BreadcrumbsResolver implements Resolve<Breadcrumb> {

  resolve(route: ActivatedRouteSnapshot): Observable<Breadcrumb> {
    const data = route.routeConfig.data;
    const path = this.getFullPath(route);
    const text = data.title;

    return of({path, text});
  }

  getFullPath(route: ActivatedRouteSnapshot): string {
    const relativePath = (segments: UrlSegment[]) => segments.reduce((buffer, item) => (buffer += '/' + item.path), '');
    const fullPath = (routes: ActivatedRouteSnapshot[]) => routes.reduce((buffer, item) => (buffer += relativePath(item.url)), '');
    return fullPath(route.pathFromRoot);
  }

}
