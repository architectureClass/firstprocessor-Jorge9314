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
static const char *ng0 = "C:/Users/utp.CRIE/Desktop/firstprocessor-juanoc097/procesador/RegisterFile.vhd";
extern char *IEEE_P_3620187407;

unsigned char ieee_p_3620187407_sub_4042748798_3965413181(char *, char *, char *, char *, char *);
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);


static void work_a_0953353097_2606300448_p_0(char *t0)
{
    char t11[16];
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    char *t19;
    int t20;
    int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 8512);
    t3 = (32U != 32U);
    if (t3 == 1)
        goto LAB2;

LAB3:    t4 = (t0 + 4032);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 32U);
    xsi_driver_first_trans_delta(t4, 0U, 32U, 0LL);
    xsi_set_current_line(29, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t9 = (t3 == (unsigned char)2);
    if (t9 != 0)
        goto LAB4;

LAB6:    xsi_set_current_line(38, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t4 = (t0 + 4096);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 32U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(39, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t4 = (t0 + 4160);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 32U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(40, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t4 = (t0 + 4224);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t1, 32U);
    xsi_driver_first_trans_fast_port(t4);

LAB5:    t1 = (t0 + 3952);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_size_not_matching(32U, 32U, 0);
    goto LAB3;

LAB4:    xsi_set_current_line(30, ng0);
    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t1 = (t0 + 7028U);
    t5 = (t0 + 8544);
    t7 = (t11 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 4;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t12 = (4 - 0);
    t13 = (t12 * 1);
    t13 = (t13 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t13;
    t14 = ieee_p_3620187407_sub_4042748798_3965413181(IEEE_P_3620187407, t4, t1, t5, t11);
    if (t14 == 1)
        goto LAB10;

LAB11:    t10 = (unsigned char)0;

LAB12:    if (t10 != 0)
        goto LAB7;

LAB9:
LAB8:    xsi_set_current_line(33, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 1032U);
    t4 = *((char **)t1);
    t1 = (t0 + 6996U);
    t12 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t4, t1);
    t20 = (t12 - 0);
    t13 = (t20 * 1);
    xsi_vhdl_check_range_of_index(0, 40, 1, t12);
    t22 = (32U * t13);
    t23 = (0 + t22);
    t5 = (t2 + t23);
    t6 = (t0 + 4096);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t15 = (t8 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(34, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 7012U);
    t12 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t4, t1);
    t20 = (t12 - 0);
    t13 = (t20 * 1);
    xsi_vhdl_check_range_of_index(0, 40, 1, t12);
    t22 = (32U * t13);
    t23 = (0 + t22);
    t5 = (t2 + t23);
    t6 = (t0 + 4160);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t15 = (t8 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(35, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 1352U);
    t4 = *((char **)t1);
    t1 = (t0 + 7028U);
    t12 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t4, t1);
    t20 = (t12 - 0);
    t13 = (t20 * 1);
    xsi_vhdl_check_range_of_index(0, 40, 1, t12);
    t22 = (32U * t13);
    t23 = (0 + t22);
    t5 = (t2 + t23);
    t6 = (t0 + 4224);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t15 = (t8 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t5, 32U);
    xsi_driver_first_trans_fast_port(t6);
    goto LAB5;

LAB7:    xsi_set_current_line(31, ng0);
    t8 = (t0 + 1512U);
    t18 = *((char **)t8);
    t8 = (t0 + 1352U);
    t19 = *((char **)t8);
    t8 = (t0 + 7028U);
    t20 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t19, t8);
    t21 = (t20 - 0);
    t13 = (t21 * 1);
    t22 = (32U * t13);
    t23 = (0U + t22);
    t24 = (t0 + 4032);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t18, 32U);
    xsi_driver_first_trans_delta(t24, t23, 32U, 0LL);
    goto LAB8;

LAB10:    t8 = (t0 + 1832U);
    t15 = *((char **)t8);
    t16 = *((unsigned char *)t15);
    t17 = (t16 == (unsigned char)3);
    t10 = t17;
    goto LAB12;

}


extern void work_a_0953353097_2606300448_init()
{
	static char *pe[] = {(void *)work_a_0953353097_2606300448_p_0};
	xsi_register_didat("work_a_0953353097_2606300448", "isim/ProcesadorSeis_TB_isim_beh.exe.sim/work/a_0953353097_2606300448.didat");
	xsi_register_executes(pe);
}
