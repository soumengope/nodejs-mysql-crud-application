const express = require('express');
const mysql = require('mysql');
require('dotenv').config();
const path = require("path");


const app = express();
const port = process.env.PORT || 5000;

//set static css file
const static_css = path.join(__dirname,"/public/css"); 
const static_photos= path.join(__dirname,"/photos");
app.use("/css",express.static(static_css));
app.use(express.json());
app.use(express.urlencoded({extended:false}));
app.use('/photos',express.static(static_photos));

//set template engine
app.set("views","./views") ;
app.set("view engine","ejs");

//create connection for mysql
const db = mysql.createConnection({
    host : 'localhost',
    user : 'root',
    password : '',
    database : 'nodemysql'
});

//connect to mysql
db.connect((err)=>{
    if(err){throw err}
    console.log('mysql connected')
})  


//create routes
app.get('/',(req,res)=>{
    const resultsPerPage = 5;
    let sql = 'SELECT * FROM employeetable';
    db.query(sql, (err, result) => {
        if(err) throw err;
        const numOfResults = result.length;
        const numberOfPages = Math.ceil(numOfResults / resultsPerPage);
        let page = req.query.page ? Number(req.query.page) : 1;
        if(page > numberOfPages){
            res.redirect('/?page='+encodeURIComponent(numberOfPages));
        }else if(page < 1){
            res.redirect('/?page='+encodeURIComponent('1'));
        }
        const startingLimit = (page - 1) * resultsPerPage;
        sql = `SELECT * FROM employeetable LIMIT ${startingLimit},${resultsPerPage}`;
        db.query(sql, (err, result)=>{
            if(err) throw err;
            let iterator = (page - 5) < 1 ? 1 : page - 5;
            let endingLink = (iterator + 9) <= numberOfPages ? (iterator + 9) : page + (numberOfPages - page);
            if(endingLink < (page - 4)){
                iterator -= (page + 4) - numberOfPages;
            }
            res.render('index', {data: result, page, iterator, endingLink, numberOfPages});
        });
    });
})

app.get('/getuser',(req,res)=>{
    res.render('getuser',{data:[0,1,2,3,4],name:""});
})
app.post('/getuser',(req,res)=>{
    let name = req.body.fullName;
    if(name.trim()==" "){
    }
    let sql = `SELECT * FROM employeetable WHERE employee_fullName LIKE '%${name}%'`;
    db.query(sql,(err,result)=>{
        if(err){throw err}
        res.render('getuser',{data:result})
    })
})

app.get('/addEmployee',(req,res)=>{
    res.render('addEmployee',{message:""});
})

app.post('/addEmployee',(req,res)=>{
    if(req.body.submit='submit'){
        const fullName = req.body.fullName.toLowerCase();
        const jobTitle = req.body.jobTitle.toLowerCase();
        const phoneNum = req.body.phoneNum.toLowerCase();
        const email = req.body.email.toLowerCase();
        const address = req.body.address.toLowerCase();
        const city = req.body.city.toLowerCase();
        const state = req.body.state.toLowerCase();
        const primEmergency_contactName = req.body.primEmergency_contactName.toLowerCase();
        const primEmergency_phoneNum = req.body.primEmergency_phoneNum.toLowerCase();
        const primEmergency_relation = req.body.primEmergency_relation.toLowerCase();
        const secEmergency_contactName = req.body.secEmergency_contactName.toLowerCase();
        const secEmergency_phoneNum = req.body.secEmergency_phoneNum.toLowerCase();
        const secEmergency_relation = req.body.secEmergency_relation.toLowerCase();
        let data = {employee_fullName:fullName,job_title:jobTitle,phone_num:phoneNum,email:email,
        address:address,city:city,state:state,primEmergency_contactName:primEmergency_contactName,
        primEmergency_phoneNum:primEmergency_phoneNum,primEmergency_relation:primEmergency_relation,
        secEmergency_contactName:secEmergency_contactName,secEmergency_phoneNum:secEmergency_phoneNum,
        secEmergency_relation:secEmergency_relation};
        let sql = 'INSERT INTO employeetable SET ?';
        db.query(sql,data,(err,result)=>{
            if(err){
                res.render('addEmployee',{message:err.message,type:'danger'})
            }
            res.redirect('/');
        })
    }
})

app.get('/edit/:id',(req,res)=>{
    let id = req.params.id;
    db.query(`SELECT * FROM employeetable WHERE user_id = ${id}`, (err, result)=> {
        if (err) throw err;
        res.render('edit_user',{user:result});
    });
})

app.post('/update_user/:id',(req,res)=>{
    let id = req.params.id;
    if(req.body.submit='submit'){
        const fullName = req.body.fullName.toLowerCase();
        const jobTitle = req.body.jobTitle.toLowerCase();
        const phoneNum = req.body.phoneNum.toLowerCase();
        const email = req.body.email.toLowerCase();
        const address = req.body.address.toLowerCase();
        const city = req.body.city.toLowerCase();
        const state = req.body.state.toLowerCase();
        const primEmergency_contactName = req.body.primEmergency_contactName.toLowerCase();
        const primEmergency_phoneNum = req.body.primEmergency_phoneNum.toLowerCase();
        const primEmergency_relation = req.body.primEmergency_relation.toLowerCase();
        const secEmergency_contactName = req.body.secEmergency_contactName.toLowerCase();
        const secEmergency_phoneNum = req.body.secEmergency_phoneNum.toLowerCase();
        const secEmergency_relation = req.body.secEmergency_relation.toLowerCase();
        let data = {employee_fullName:fullName,job_title:jobTitle,phone_num:phoneNum,email:email,
        address:address,city:city,state:state,primEmergency_contactName:primEmergency_contactName,
        primEmergency_phoneNum:primEmergency_phoneNum,primEmergency_relation:primEmergency_relation,
        secEmergency_contactName:secEmergency_contactName,secEmergency_phoneNum:secEmergency_phoneNum,
        secEmergency_relation:secEmergency_relation};
        let sql = `UPDATE employeetable SET ? WHERE user_id = ${id}`;
        db.query(sql,data,(err,result)=>{
            if(err){
                res.json({message:err.message,type:'danger'})
            }
            res.redirect('/');
        })
    }
})

app.get('/delete/:id',(req,res)=>{
    let id = req.params.id;
    db.query(`DELETE from employeetable WHERE user_id = ${id}`, (err, result)=> {
        if (err) throw err;
        res.redirect('/');
    });
})

app.listen(port,()=>{
    console.log(`server is running on port ${port}`);
})