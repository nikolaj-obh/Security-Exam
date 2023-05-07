import {Injectable} from "@angular/core";
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {BehaviorSubject, Observable, tap} from "rxjs";
import {map} from "rxjs/operators";

const AUTH_API = 'http://localhost:8080/api/auth/'

const httpOptions = {
  headers: new HttpHeaders({'Content-type': 'application/json'})
}

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private _isLoggedIn = new BehaviorSubject<boolean>(false);
  private currentUser = new BehaviorSubject<any>(null);
  isLoggedIn = this._isLoggedIn.asObservable();

  constructor(private http: HttpClient) {
    const token = localStorage.getItem('token')
    this._isLoggedIn.next(!!token);
  }

  getCurrentUser(){
    return this.currentUser.asObservable();
  }

  login(user: { email: any; password: any; }): Observable<any> {
    return this.http.post(AUTH_API + 'login' ,{
      email: user.email,
      password: user.password
    }, httpOptions).pipe(
      tap((response: any) => {
        localStorage.setItem('token', response.token)
        //this.currentUser.next(userInfo);
        this._isLoggedIn.next(true);
        this.currentUser.next(response.user);
        //console.log(userInfo)
        //return userInfo.user
      })
    );
  }

  register(user: { /*name: any;*/ email: any; password: any; }): Observable<any> {
    return this.http.post(AUTH_API + 'register', {
      //name: user.name,
      email: user.email,
      password: user.password
    }, )
  }

  logout() {
    localStorage.removeItem('token');
    this._isLoggedIn.next(false);
    this.currentUser.next(null);
  }
}
