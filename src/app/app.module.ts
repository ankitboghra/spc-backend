import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { AppComponent } from './app.component';
import { SidebarComponent } from './sidebar.component';
import { CityTblComponent } from './city-tbl/city-tbl.component';
import { CitydataService } from './shared/citydata.service';
import { HeaderComponent } from './header.component';
import { routing } from './app.routing';
import { AddcityComponent } from './city-tbl/addcity.component';
import { EditcityComponent } from './city-tbl/editcity.component';
import { AnsTblComponent } from './ans-tbl/ans-tbl.component';
import { AnsdataService } from './shared/ansdata.service';
import { BookTblComponent } from './book-tbl/book-tbl.component';
import {  BookdataService } from './shared/bookdata.service';
import { EventQueTblComponent } from './event-que-tbl/event-que-tbl.component';
import { EventQuedataService } from './shared/event-quedata.service';
import { EventComponent } from './event/event.component';
import { ApproveComponent } from './event/approve.component';
import { EventdataService } from './shared/eventdata.service';
@NgModule({
  declarations: [
    AppComponent,
    SidebarComponent,
    CityTblComponent,
    HeaderComponent,
    AddcityComponent,
    EditcityComponent,
    AnsTblComponent,
    BookTblComponent,
    EventQueTblComponent,
    EventComponent,
    ApproveComponent,
    
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    routing
  ],
  providers: [CitydataService,AnsdataService,BookdataService,EventQuedataService,EventdataService],
  bootstrap: [AppComponent]
})
export class AppModule { }
