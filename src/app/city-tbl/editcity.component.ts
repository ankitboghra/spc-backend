import { Component, OnInit } from '@angular/core';
import { Router,ActivatedRoute } from '@angular/router';
import { Cityclass } from '../shared/cityclass';
import { CitydataService } from '../shared/citydata.service';
import { Subscription } from 'rxjs/Rx';
@Component({
  selector: 'app-editcity',
  templateUrl: './editcity.component.html',
  styles: []
})
export class EditcityComponent implements OnInit {
public _subscription:Subscription;
public cityarr:Cityclass[]=[];
public city_id:number;
public city_name:string;
  constructor(private _citydataservice:CitydataService,private _router:Router,private _acrouter:ActivatedRoute ) { }

  ngOnInit() {
     this._subscription=this._acrouter.params.subscribe(
      (params:any)=>{
        this.city_id=params["id"];
       
      }
    );
    this._citydataservice.getCitybyId(this.city_id).subscribe(
      (data:Cityclass[])=>{
        this.cityarr=data;
        this.city_name=this.cityarr[0].city_name;
      },
      function(error)
      {

      },
      function()
      {
        console.log("successfully get in edit");
      }
    );
  }
editcity()
{
  this._citydataservice.editcity(new Cityclass(this.city_id,this.city_name)).subscribe(
    (data:any)=>
    {
      this._router.navigate(['/allcity']);
    },
    function(error)
    {

    },
    function()
    {
      console.log("edited");
    }
  );
}
}
