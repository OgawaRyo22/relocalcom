   function prov(){
        $(".posts").removeClass("pos_visi1 pos_visi2 pos_visi3");
        $(".p_view").removeClass("p_move1 p_move2 p_move3");
        $(".chatting").removeClass("chatting1 chatting2 chatting3");
       $(".setting").removeClass("setting1 setting2 setting3");
       }  

function addv(){
                      $(".posts").addClass("pos_visi1");
                      $(".p_view").addClass("p_move1");
     $(".chatting").addClass("chatting1");
    $(".setting").addClass("setting1");
    
     $(".posts").removeClass("pos_visi2 pos_visi3");
        $(".p_view").removeClass("p_move2 p_move3");
    $(".chatting").removeClass("chatting2 chatting3");
       $(".setting").removeClass("setting2 setting3");
                  };
       
      

function chav(){
           $(".posts").addClass("pos_visi2");
           $(".p_view").addClass("p_move2");
    $(".chatting").addClass("chatting2");
        $(".setting").addClass("setting2");
    
           $(".posts").removeClass("pos_visi1 pos_visi3");
           $(".p_view").removeClass("p_move1 p_move3");
      $(".chatting").removeClass("chatting1 chatting3");
       $(".setting").removeClass("setting1 setting3");
       }   

function setv(){
           $(".posts").addClass("pos_visi3");
           $(".p_view").addClass("p_move3");
    $(".chatting").addClass("chatting3");
        $(".setting").addClass("setting3");
    
           $(".posts").removeClass("pos_visi1 pos_viso2");
           $(".p_view").removeClass("p_move1 p_move2");
      $(".chatting").removeClass("chatting1 chatting2");
       $(".setting").removeClass("setting1 setting2");
       }    
