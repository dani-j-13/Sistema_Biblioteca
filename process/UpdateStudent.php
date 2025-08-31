<?php
session_start();
include '../library/configServer.php';
include '../library/consulSQL.php';
include '../library/SED.php';
$studentDNIOld=consultasSQL::CleanStringText($_POST['studentDNIOld']);
$studentDNIOld=consultasSQL::CleanStringText($_POST['studentDNI']);
$studentName=consultasSQL::CleanStringText($_POST['studentName']);
$studentSurname=consultasSQL::CleanStringText($_POST['studentSurname']);
$studentSection=consultasSQL::CleanStringText($_POST['studentSection']);
$representativeRelationship=consultasSQL::CleanStringText($_POST['representativeRelationship']);
$representativeDUIold=consultasSQL::CleanStringText($_POST['representativeDUIold']);
$representativeDUI=consultasSQL::CleanStringText($_POST['representativeDUI']);
$representativeName=consultasSQL::CleanStringText($_POST['representativeName']);
$representativePhone=consultasSQL::CleanStringText($_POST['representativePhone']);
$UserName=consultasSQL::CleanStringText($_POST['UserName']);
$UserNameOld=consultasSQL::CleanStringText($_POST['UserNameOld']);
$Password1=consultasSQL::CleanStringText($_POST['Password1']);
$Password2=consultasSQL::CleanStringText($_POST['Password2']);
$FinalPassword=SED::encryption($Password1);
if($Password1==$Password2){
    if($UserNameOld==$UserName){
        $totalCheckUser=0;
    }else{
        $checkUserName=ejecutarSQL::consultar("SELECT * FROM estudiante WHERE NombreUsuario='".$UserName."'");
        $totalCheckUser=mysqli_num_rows($checkUserName);
    }
    if($totalCheckUser<=0){
        if($studentDNIOld==$studentDNI){
            if($representativeDUIold==$representativeDUI){
                if($Password1!="" && $Password2!=""){
                    $fields="CodigoSeccion='$studentSection',Nombre='$studentName',NombreUsuario='$UserName',Clave='$FinalPassword',Apellido='$studentSurname',Parentesco='$representativeRelationship'";
                }else{
                    $fields="CodigoSeccion='$studentSection',Nombre='$studentName',NombreUsuario='$UserName',Apellido='$studentSurname',Parentesco='$representativeRelationship'";
                }
                if(consultasSQL::UpdateSQL("estudiante", $fields, "DNI='$studentDNIOld'")){
                    echo '<script type="text/javascript">
                        swal({ 
                            title:"¡Estudiante actualizado!", 
                            text:"Los datos del estudiante se actualizaron correctamente", 
                            type: "success", 
                            confirmButtonText: "Aceptar" 
                        },
                        function(isConfirm){  
                            if (isConfirm) {     
                                location.reload();
                            } else {    
                                location.reload();
                            } 
                        });
                    </script>'; 
                }else{
                    echo '<script type="text/javascript">
                        swal({ 
                            title:"¡Ocurrió un error inesperado!", 
                            text:"No hemos podido actualizar los datos del estudiante, por favor intenta nuevamente", 
                            type: "error", 
                            confirmButtonText: "Aceptar" 
                        });
                    </script>';
                }
            }else{
                if(consultasSQL::InsertSQL("encargado", "DUI,Nombre,Telefono", "'$representativeDUI','$representativeName','$representativePhone'")){
                    if($Password1!="" && $Password2!=""){
                        $fields="DUI='$representativeDUI',CodigoSeccion='$studentSection',Nombre='$studentName',NombreUsuario='$UserName',Clave='$FinalPassword',Apellido='$studentSurname',Parentesco='$representativeRelationship'";
                    }else{
                        $fields="DUI='$representativeDUI',CodigoSeccion='$studentSection',Nombre='$studentName',NombreUsuario='$UserName',Apellido='$studentSurname',Parentesco='$representativeRelationship'";
                    }
                    if(consultasSQL::UpdateSQL("estudiante", $fields, "DNI='$studentDNIOld'")){
                        echo '<script type="text/javascript">
                            swal({ 
                                title:"¡Estudiante actualizado!", 
                                text:"Los datos del estudiante se actualizaron correctamente", 
                                type: "success", 
                                confirmButtonText: "Aceptar" 
                            },
                            function(isConfirm){  
                                if (isConfirm) {     
                                    location.reload();
                                } else {    
                                    location.reload();
                                } 
                            });
                        </script>';
                    }else{
                        consultasSQL::DeleteSQL("encargado", "DUI='$representativeDUI'");
                        echo '<script type="text/javascript">
                            swal({ 
                                title:"¡Ocurrió un error inesperado!", 
                                text:"No hemos podido actualizar los datos del estudiante, por favor intenta nuevamente", 
                                type: "error", 
                                confirmButtonText: "Aceptar" 
                            });
                        </script>';
                    }
                }else{
                    echo '<script type="text/javascript">
                        swal({ 
                            title:"¡Ocurrió un error inesperado!", 
                            text:"No hemos podido actualizar los datos del estudiante, por favor intenta nuevamente", 
                            type: "error", 
                            confirmButtonText: "Aceptar" 
                        });
                    </script>';
                }
            }
        }else{
            $checkDNI=ejecutarSQL::consultar("SELECT * FROM estudiante WHERE DNI='$studentDNI'");
            if(mysqli_num_rows($checkDNI)<=0){
                if($representativeDUIold==$representativeDUI){
                    if($Password1!="" && $Password2!=""){
                        $fields="DNI='$studentDNI',CodigoSeccion='$studentSection',Nombre='$studentName',NombreUsuario='$UserName',Clave='$FinalPassword',Apellido='$studentSurname',Parentesco='$representativeRelationship'";
                    }else{
                        $fields="DNI='$studentDNI',CodigoSeccion='$studentSection',Nombre='$studentName',NombreUsuario='$UserName',Apellido='$studentSurname',Parentesco='$representativeRelationship'";
                    }
                    if(consultasSQL::UpdateSQL("estudiante", $fields, "DNI='$studentDNIOld'")){
                        echo '<script type="text/javascript">
                            swal({ 
                                title:"¡Estudiante actualizado!", 
                                text:"Los datos del estudiante se actualizaron correctamente", 
                                type: "success", 
                                confirmButtonText: "Aceptar" 
                            },
                            function(isConfirm){  
                                if (isConfirm) {     
                                    location.reload();
                                } else {    
                                    location.reload();
                                } 
                            });
                        </script>';    
                    }else{
                        echo '<script type="text/javascript">
                            swal({ 
                                title:"¡Ocurrió un error inesperado!", 
                                text:"No hemos podido actualizar los datos del estudiante, por favor intenta nuevamente", 
                                type: "error", 
                                confirmButtonText: "Aceptar" 
                            });
                        </script>';
                    }
                }else{
                    if(consultasSQL::InsertSQL("encargado", "DUI,Nombre,Telefono", "'$representativeDUI','$representativeName','$representativePhone'")){
                        if($Password1!="" && $Password2!=""){
                            $fields="DNI='$studentDNI',DUI='$representativeDUI',CodigoSeccion='$studentSection',Nombre='$studentName',NombreUsuario='$UserName',Clave='$FinalPassword',Apellido='$studentSurname',Parentesco='$representativeRelationship'";
                        }else{
                            $fields="DNI='$studentDNI',DUI='$representativeDUI',CodigoSeccion='$studentSection',Nombre='$studentName',NombreUsuario='$UserName',Apellido='$studentSurname',Parentesco='$representativeRelationship'";
                        }
                        if(consultasSQL::UpdateSQL("estudiante", $fields, "DNI='$studentDNIOld'")){
                            echo '<script type="text/javascript">
                                swal({ 
                                    title:"¡Estudiante actualizado!", 
                                    text:"Los datos del estudiante se actualizaron correctamente", 
                                    type: "success", 
                                    confirmButtonText: "Aceptar" 
                                },
                                function(isConfirm){  
                                    if (isConfirm) {     
                                        location.reload();
                                    } else {    
                                        location.reload();
                                    } 
                                });
                            </script>';  
                        }else{
                            consultasSQL::DeleteSQL("encargado", "DUI='$representativeDUI'");
                            echo '<script type="text/javascript">
                                swal({ 
                                    title:"¡Ocurrió un error inesperado!", 
                                    text:"No hemos podido actualizar los datos del estudiante, por favor intenta nuevamente", 
                                    type: "error", 
                                    confirmButtonText: "Aceptar" 
                                });
                            </script>';
                        }
                    }else{
                        echo '<script type="text/javascript">
                            swal({ 
                                title:"¡Ocurrió un error inesperado!", 
                                text:"No hemos podido actualizar los datos del estudiante, por favor intenta nuevamente", 
                                type: "error", 
                                confirmButtonText: "Aceptar" 
                            });
                        </script>';
                    }
                }
            }else{
                echo '<script type="text/javascript">
                    swal({ 
                        title:"¡Ocurrió un error inesperado!", 
                        text:"El DNI que acabas de escribir ya está asignado a otro estudiante, por favor verifica e intenta nuevamente", 
                        type: "error", 
                        confirmButtonText: "Aceptar" 
                    });
                </script>';
            }
        }
    }else{
       echo '<script type="text/javascript">
            swal({ 
                title:"¡Ocurrió un error inesperado!", 
                text:"Has introducido un nombre de usuario que ya esta siendo utilizado, por favor ingresa otro nombre", 
                type: "error", 
                confirmButtonText: "Aceptar" 
            });
        </script>'; 
    }
}else{
    echo '<script type="text/javascript">
        swal({ 
            title:"¡Ocurrió un error inesperado!", 
            text:"Las contraseñas no coinciden, por favor verifica e intenta nuevamente", 
            type: "error", 
            confirmButtonText: "Aceptar" 
        });
    </script>';
}
mysqli_free_result($checkDNI);
mysqli_free_result($checkUserName);