export class EventQueTbl {
    public constructor(public pk_que_id:number,public fk_email_id:string,
    public fk_event_id:number,public que_desc:string,public que_date:string,
    public pk_email_di:string,public user_password:string,public user_mobile_no:string,
    public user_name:string,public fk_city_id:number,public user_type:string)
    {

    }
}
