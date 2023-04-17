import {Injectable} from "@angular/core";
import {HTTP_INTERCEPTORS, HttpEvent, HttpHandler, HttpInterceptor, HttpRequest} from "@angular/common/http";
import {Observable} from "rxjs";
import {TokenService} from "../services/token.service";

const TOKEN_KEY = 'Authorization';

@Injectable()
export class AuthInterceptor implements HttpInterceptor{
  constructor(private token: TokenService) {}

  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    let authRequest = req;
    const token = this.token.getToken();
    if(token != null){
      authRequest = req.clone({headers: req.headers.set(TOKEN_KEY, 'Bearer ' + token)})
    }
    return next.handle(authRequest);
  }
}

export const authInterceptionProviders = [
  { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi:true}
];
