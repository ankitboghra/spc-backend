import { Injectable } from '@angular/core';
import { Http,RequestOptions,Response,Headers } from '@angular/http';
import { Ansclass } from './ansclass';
import 'rxjs/Rx';
@Injectable()
export class AnsdataService {
public url:string="http://localhost:3000/ansdetails/";
public url1:string="http://localhost:3000/ans/";

  constructor(private _http:Http) { }
 getAllAns()
  {
    return this._http.get(this.url).map(
      (res:Response)=>res.json()
    );
  }
 deleteans(Id:number)
{
  let header=new Headers({'Content-Type':'application/json'});
  let req=new RequestOptions({headers:header});
  return this._http.delete(this.url1+Id,req);
}
}
