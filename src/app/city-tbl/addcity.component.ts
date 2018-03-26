import { Component, OnInit } from '@angular/core';
import { Router} from '@angular/router';
import { Cityclass } from '../shared/cityclass';
import { CitydataService } from '../shared/citydata.service';

@Component({
  selector: 'app-addcity',
  templateUrl: './addcity.component.html',
  styles: []
})
export class AddcityComponent implements OnInit {
public city:Cityclass=new Cityclass(null,'');
  constructor(private _citydataservice:CitydataService,private _router:Router) { }

  ngOnInit() {
  }
  addcity()
  {
    this._citydataservice.addcity(this.city).subscribe(
      (data:any)=>{
        this._router.navigate(['/allcity']);
},
function(error){
  console.log(error);
},
function()
{

}
  );
  }

}
