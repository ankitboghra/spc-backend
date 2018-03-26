import { Injectable } from '@angular/core';
import { Http,Response,RequestOptions,Headers} from '@angular/http';
import { EventQueTbl } from './event-que-tbl';
import 'rxjs/Rx';
@Injectable()
export class EventQuedataService {
public url:string="http://localhost:3000/quedetails/";
public url1:string="http://localhost:3000/deleteallans/";
public url2:string="http://localhost:3000/event_que/";
  constructor(private _http:Http) { }
getAllQue()
  {
    return this._http.get(this.url).map(
      (res:Response)=>res.json()
    );
  }
 deleteQue(Id:number)
{
  let header=new Headers({'Content-Type':'application/json'});
  let req=new RequestOptions({headers:header});
  return this._http.delete(this.url2+Id,req);
 
}
deleteAns(Id:number)
{
  let header=new Headers({'Content-Type':'application/json'});
  let req=new RequestOptions({headers:header});
 return this._http.delete(this.url1+Id,req);
}
}
