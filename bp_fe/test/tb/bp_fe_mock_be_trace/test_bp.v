/**
 *
 * test_bp.v
 *
 */

`include "bsg_defines.v"

`include "bp_common_fe_be_if.vh"
`include "bp_common_me_if.vh"

`include "bp_be_internal_if_defines.vh"
`include "bp_be_rv64_defines.vh"

module test_bp
 #(
   parameter core_els_p="inv"
   ,parameter vaddr_width_p="inv"
   ,parameter paddr_width_p="inv"
   ,parameter asid_width_p="inv"
   ,parameter eaddr_width_p="inv"
   ,parameter branch_metadata_fwd_width_p="inv"
   ,parameter num_cce_p="inv"
   ,parameter num_lce_p="inv"
   ,parameter num_mem_p="inv"
   ,parameter lce_sets_p="inv"
   ,parameter lce_assoc_p="inv"
   ,parameter cce_block_size_in_bytes_p="inv"
   ,parameter cce_num_inst_ram_els_p="inv"

   ,parameter boot_rom_width_p="inv"
   ,parameter boot_rom_els_p="inv"

   ,parameter trace_data_width_p="inv"
   ,parameter trace_addr_width_p="inv"
 );

logic clk, reset;

bsg_nonsynth_clock_gen #(.cycle_time_p(10)
                         )
              clock_gen (.o(clk)
                         );

bsg_nonsynth_reset_gen #(.num_clocks_p(1)
                         ,.reset_cycles_lo_p(1)
                         ,.reset_cycles_hi_p(10)
                         )
               reset_gen(.clk_i(clk)
                         ,.async_reset_o(reset)
                         );

bp_fe_mock_be_wrapper #(.core_els_p(core_els_p)
                        ,.vaddr_width_p(vaddr_width_p)
                        ,.paddr_width_p(paddr_width_p)
                        ,.asid_width_p(asid_width_p)
                        ,.branch_metadata_fwd_width_p(branch_metadata_fwd_width_p)
                        ,.num_cce_p(num_cce_p)
                        ,.num_lce_p(num_lce_p)
                        ,.num_mem_p(num_mem_p)
                        ,.lce_sets_p(lce_sets_p)
                        ,.lce_assoc_p(lce_assoc_p)
                        ,.cce_block_size_in_bytes_p(cce_block_size_in_bytes_p)
                        ,.cce_num_inst_ram_els_p(cce_num_inst_ram_els_p)
                        
                        ,.boot_rom_width_p(boot_rom_width_p)
                        ,.boot_rom_els_p(boot_rom_els_p)

) bp_fe_mock_be_trace (.clk_i(clk)
                 ,.reset_i(reset)
                 );
endmodule : test_bp

