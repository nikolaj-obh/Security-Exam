import {Injectable} from "@angular/core";

const TOKEN_KEY = 'token'
//const USER_KEY = 'auth-user'

@Injectable({
  providedIn: 'root'
})
export class TokenService{
  constructor() {
  }

/*  signOut(): void {
    window.sessionStorage.clear();
  }

  public saveToken(token: string){
    window.sessionStorage.removeItem(TOKEN_KEY);
    window.sessionStorage.setItem(TOKEN_KEY, token);
  }*/

  public getToken(): any {
    return localStorage.getItem(TOKEN_KEY);
  }

/*  public saveUser(user: any): void {
   window.sessionStorage.removeItem(USER_KEY);
   window.sessionStorage.setItem(USER_KEY, JSON.stringify(user));
  }

  public getUser(): any {
    // @ts-ignore
    return JSON.parse(sessionStorage.getItem(USER_KEY));
  }*/
}
