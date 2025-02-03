/*****************************************************************************/
/** UTMSGC: CLP UTILITY SYSTEM MESSAGE PROGRAM                              **/
/**-------------------------------------------------------------------------**/
/** AUTHOR : TIM WRIGHT                                                     **/
/** DATE   : 08/06/1993                                                     **/
/**-------------------------------------------------------------------------**/
/**                                                                         **/
/*****************************************************************************/
 UTMSGC:     PGM        PARM(&MSGFIL &MSGID &MSGCLR &MSGSUB)

             DCL        VAR(&MSGFIL) TYPE(*CHAR) LEN(10)
             DCL        VAR(&MSGID ) TYPE(*CHAR) LEN(07)
             DCL        VAR(&MSGCLR) TYPE(*CHAR) LEN(01)
             DCL        VAR(&MSGSUB) TYPE(*CHAR) LEN(10)

             MONMSG     MSGID(CPF0000) EXEC(GOTO CMDLBL(BADMSG))

             IF         COND(&MSGCLR *EQ '1') THEN(RMVMSG PGMQ(*PRV +
                          *) MSGQ(*PGMQ) CLEAR(*ALL))

             IF         COND(&MSGID *NE ' ') THEN(DO)
             SNDPGMMSG  MSGID(&MSGID) MSGF(*LIBL/&MSGFIL) +
                          MSGDTA(&MSGSUB) TOPGMQ(*PRV) MSGTYPE(*INFO)
             ENDDO

             RETURN

 BADMSG:     ENDPGM
