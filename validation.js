/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function check(form)

{
   // if check1(form)
   // {
    //();
    
    //}
}
function check1(form)
{
  var user_id = form.uid.value;
  var pass = form.pwd.value;
  if(user_id==="" || pass==="")
  {
     alert("UserId or Password is blank");
 return false;
  }
  if(isNaN(user_id) || user_id.length!==5)
  {alert("Enter the valid 5 digit username");
   return false;
  }
  form.submit();
 }