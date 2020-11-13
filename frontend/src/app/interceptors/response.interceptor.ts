import { tap } from 'rxjs/operators';
import { HttpInterceptor, HttpHandler, HttpRequest, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ResponseInterceptor implements HttpInterceptor {
  intercept(req: HttpRequest<any>, next: HttpHandler) {
    return next.handle(req)
      .pipe(tap(event => {
        if (event instanceof HttpResponse && event.headers.has('x-token')) {
          localStorage.token = event.headers.get('x-token');
        }
      }));
  }
}
