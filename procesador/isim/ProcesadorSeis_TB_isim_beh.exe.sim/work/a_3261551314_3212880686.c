/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/utp.CRIE/Desktop/firstprocessor-juanoc097/procesador/DataMemory.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_2599155846_3965413181(char *, int , char *, char *);
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_3261551314_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned int t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    unsigned char t15;
    int t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;

LAB0:    xsi_set_current_line(24, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t8 = (t4 == (unsigned char)3);
    if (t8 == 1)
        goto LAB10;

LAB11:    t3 = (unsigned char)0;

LAB12:    if (t3 != 0)
        goto LAB7;

LAB9:
LAB8:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 6556U);
    t3 = ieee_p_3620187407_sub_2599155846_3965413181(IEEE_P_3620187407, 520, t2, t1);
    if (t3 != 0)
        goto LAB13;

LAB15:
LAB14:
LAB3:    t1 = (t0 + 3720);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(25, ng0);
    t1 = xsi_get_transient_memory(16640U);
    memset(t1, 0, 16640U);
    t5 = t1;
    t6 = (t0 + 23382);
    t8 = (32U != 0);
    if (t8 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 3816);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t1, 16640U);
    xsi_driver_first_trans_fast(t10);
    goto LAB3;

LAB5:    t9 = (16640U / 32U);
    xsi_mem_set_data(t5, t6, 32U, t9);
    goto LAB6;

LAB7:    xsi_set_current_line(28, ng0);
    t6 = (t0 + 1032U);
    t7 = *((char **)t6);
    t6 = (t0 + 1192U);
    t10 = *((char **)t6);
    t6 = (t0 + 6556U);
    t16 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t10, t6);
    t17 = (t16 - 0);
    t9 = (t17 * 1);
    t18 = (32U * t9);
    t19 = (0U + t18);
    t11 = (t0 + 3816);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t20 = *((char **)t14);
    memcpy(t20, t7, 32U);
    xsi_driver_first_trans_delta(t11, t19, 32U, 0LL);
    goto LAB8;

LAB10:    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t1 = (t0 + 6556U);
    t15 = ieee_p_3620187407_sub_2599155846_3965413181(IEEE_P_3620187407, 520, t5, t1);
    t3 = t15;
    goto LAB12;

LAB13:    xsi_set_current_line(31, ng0);
    t5 = (t0 + 1832U);
    t6 = *((char **)t5);
    t5 = (t0 + 1192U);
    t7 = *((char **)t5);
    t5 = (t0 + 6556U);
    t16 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t7, t5);
    t17 = (t16 - 0);
    t9 = (t17 * 1);
    xsi_vhdl_check_range_of_index(0, 519, 1, t16);
    t18 = (32U * t9);
    t19 = (0 + t18);
    t10 = (t6 + t19);
    t11 = (t0 + 3880);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t20 = *((char **)t14);
    memcpy(t20, t10, 32U);
    xsi_driver_first_trans_fast(t11);
    goto LAB14;

}

static void work_a_3261551314_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(36, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 3944);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3736);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3261551314_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3261551314_3212880686_p_0,(void *)work_a_3261551314_3212880686_p_1};
	xsi_register_didat("work_a_3261551314_3212880686", "isim/ProcesadorSeis_TB_isim_beh.exe.sim/work/a_3261551314_3212880686.didat");
	xsi_register_executes(pe);
}
