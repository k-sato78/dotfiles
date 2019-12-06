#!/usr/local/bin/zsh 
#
 if [ $# -lt 1 ]
      then
              echo "Usage:"
                      echo " # " $0 "'JCL_name' [SleepTime]"
                        echo " "
                          echo " Example1:"
                            echo "  # " $0 "'CICSSHR.CICS004.JCLLIB(LISTC)'"
                              echo "   default SleepTime=5 "
                                echo " "
                                        echo " Example2:"
                                                echo "  # " $0 "'CICSSHR.CICS004.JCLLIB(LISTC)' 10"
                                                        echo " "
                                                                exit 1
                                                                fi

ssh epa sh << EOF
. ./.profile
jcl_sub.rex '$1'
EOF


