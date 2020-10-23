
require(openxlsx)

read.all.xlsx <-  function(xlsxFile,  SheetNames = NA, ...) {
  
  if (is.na(SheetNames[1])) {
    sheet_names = openxlsx::getSheetNames(xlsxFile)
  }else if(is.double(SheetNames[1])) {
    sheet_names = openxlsx::getSheetNames(xlsxFile)[SheetNames]
  }else{
    sheet_names = SheetNames
  }
  
  sheet_list = as.list(rep(NA, length(sheet_names)))
  names(sheet_list) = as.character(sheet_names)
  
  for (sn in sheet_names) {
    message(sn)
    sheet_list[[sn]] = openxlsx::read.xlsx(xlsxFile, sheet=sn, ...)
  }
  
  return(sheet_list)
}
