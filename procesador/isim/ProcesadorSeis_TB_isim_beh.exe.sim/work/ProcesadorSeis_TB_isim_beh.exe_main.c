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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3499444699;
char *IEEE_P_1242562249;
char *IEEE_P_3620187407;
char *STD_TEXTIO;
char *IEEE_P_0774719531;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    ieee_p_0774719531_init();
    work_a_1007874614_2241013471_init();
    work_a_1153420228_1195378251_init();
    work_a_0123541133_0885986294_init();
    work_a_3781366023_3212880686_init();
    work_a_0542593727_3212880686_init();
    work_a_0295498852_3999931507_init();
    work_a_3961274036_0397955563_init();
    work_a_4230865673_3212880686_init();
    work_a_0953353097_2606300448_init();
    work_a_0992986323_2533543878_init();
    work_a_2096391741_4224193812_init();
    work_a_0290344353_3049860944_init();
    work_a_0832606739_1499595665_init();
    work_a_0837881064_1457404866_init();
    work_a_0056314447_2721216654_init();
    work_a_3261551314_3212880686_init();
    work_a_2654435474_0250639086_init();
    work_a_1749186892_3212880686_init();
    work_a_3378557570_2372691052_init();


    xsi_register_tops("work_a_3378557570_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_0774719531 = xsi_get_engine_memory("ieee_p_0774719531");

    return xsi_run_simulation(argc, argv);

}
