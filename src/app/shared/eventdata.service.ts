import { Injectable } from '@angular/core';
import { Http,Response,RequestOptions,Headers} from '@angular/http';
import { EventQueTbl } from './event-que-tbl';
import 'rxjs/Rx';
@Injectable()
export class EventdataService {
public url:string="http://localhost:3000/event/";
  constructor(private _http:Http) { }
  getAllevent()
  {
    return this._http.get(this.url).map(
      (res:Response)=>res.json()
    );
  }
 deleteEvent(Id:number)
{
  let header=new Headers({'Content-Type':'application/json'});
  let req=new RequestOptions({headers:header});
  return this._http.delete(this.url+Id,req);
 
}

}
