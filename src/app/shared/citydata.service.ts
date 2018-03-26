import { Injectable } from '@angular/core';
import { Cityclass } from './cityclass';
import { Http,RequestOptions,Headers ,Response} from '@angular/http';
import 'rxjs/Rx';

@Injectable()
export class CitydataService {
private url:string="http://localhost:3000/cities/";
  constructor(private _http:Http,) { }
  getAllCity()
  {
    return this._http.get(this.url).map(
      (res:Response)=>res.json()
    );
  }
   getCitybyId(id:number)
  {
    return this._http.get(this.url+id).map(
      (res:Response)=>res.json()
    );
  }
   editcity(item:Cityclass)
  {
    let body=JSON.stringify(item);
    let header=new Headers({'Content-Type':'application/json'});
    let option=new RequestOptions({headers:header});
   return this._http.put(this.url+item.pk_city_id,body,option).map(
      (res:Response)=>res.json()
    );
  }
  addcity(item:Cityclass)
  {
      let body=JSON.stringify(item);
    let header=new Headers({'Content-Type':'application/json'});
    let option=new RequestOptions({headers:header});
    return this._http.post(this.url,body,option).map(
      (res:Response)=>res.json()
    );
  }

  deletecity(Id:number)
{
  let header=new Headers({'Content-Type':'application/json'});
  let req=new RequestOptions({headers:header});
  return this._http.delete(this.url+Id,req);
}

}
