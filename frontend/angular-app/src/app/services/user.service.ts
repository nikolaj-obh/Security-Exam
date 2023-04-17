import {Injectable} from "@angular/core";
import {User} from "../models/user";
import {environment} from "../../environments/environment";
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs";

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private apiServerUrl = environment.apiBaseUrl;

  constructor(private http: HttpClient) { }

  public getUsers(): Observable<User[]> {
    return this.http.get<User[]>(`${this.apiServerUrl}/api/users/`);
  }

  public updateUser(user: User): Observable<User> {
    return this.http.put<User>(`${this.apiServerUrl}/api/users/update`, user);
  }

  public deleteUser(userId: number): Observable<void> {
    return this.http.delete<void>(`${this.apiServerUrl}/api/users/delete/${userId}`);
  }
}
