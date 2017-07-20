#  This script should be sourced (via an alias) to set desired compilation flags

# Script maintenance note:  The numbers below are indices into the flags vector
echo "Enter carriage return to unset MORE_CPPFLAGS; otherwise,"
echo "Enter numbers (space separated) to set MORE_CPPFLAGS option(s):"
echo "  WET Options:"
echo "1. OUTPUT_BTR_SCANS" 
echo "2. OUTPUT_CLUSTER_TRACKS" 
echo "3. OUTPUT_PROMOS"
echo "4. TRACK_ON_SUBBAND_0"
echo "5. TRACK_ON_SUBBAND_1"
echo "6. TRACK_ON_SUBBAND_2"
echo "7. WRITE_3BIT_DATA"
echo "  3DLT Options:"
echo "10. REPORT_EXCURSION_MEASURES"
echo "11. CLUSTER_FILE"
echo "12. REPORT_PROMOS"
echo "13. DEBUG_STORE_LOCAL_BTR"
echo "14. DEBUG_AST_ASSOCIATION"
echo "15. GET_TIMING"
echo "16. DEBUG_STORE_FRAZ_DATA"
echo "17. PLT_TRKS_DATA:"
echo "18. MITRE_CLUSTERS"
echo "19. READ_NUWC_SCOT"
echo ''
set data_num = ( $< )
set data_num = ( $data_num )

# Script maintenance note:  The indices of the flags vector below correspond
#   to the selection numbers above.
set flags = ( \
  '-DOUTPUT_BTR_SCANS' \
  '-DOUTPUT_CLUSTER_TRACKS' \
  '-DOUTPUT_PROMOS' \
  '-DTRACK_ON_SUBBAND_0' \
  '-DTRACK_ON_SUBBAND_1' \
  '-DTRACK_ON_SUBBAND_2' \
  '-DWRITE_3BIT_DATA' \
  '' \
  '' \
  '-DREPORT_EXCURSION_MEASURES' \
  '-DCLUSTER_FILE' \
  '-DREPORT_PROMOS' \
  '-DDEBUG_STORE_LOCAL_BTR' \
  '-DDEBUG_AST_ASSOCIATION'\
  '-DGET_TIMING'\
  '-DDEBUG_STORE_FRAZ_DATA'\
  '-DPLT_TRKS_DATA'\
  '-DMITRE_CLUSTERS'\
  '-DREAD_NUWC_SCOT'\
)

setenv MORE_CPPFLAGS ''

set quote = "'"
foreach f ( $data_num )
  set val = `echo $quote $MORE_CPPFLAGS $flags[$f] $quote`
  eval setenv MORE_CPPFLAGS "$val"
end

echo ''
set plural = 's'
if ($#data_num == 1) set plural = ''
echo "MORE_CPPFLAGS has $#data_num flag$plural set:"
echo "  $MORE_CPPFLAGS"
