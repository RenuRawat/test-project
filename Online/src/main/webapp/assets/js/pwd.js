$alert

                        $(document).ready(function(){
                            $("#password_show_button").mouseup(function(){
                                $("#password_show").attr("type", "password");
                            });
                            $("#password_show_button").mousedown(function(){
                                $("#password_show").attr("type", "text");
                            });
                        });
                        