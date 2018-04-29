library(tercen)
library(dplyr)

do.fc = function(df, reverse) {
  log_ratio = NaN
  
  if (reverse) {
    first = 2
    second = 1
  }
  else {
    first = 1
    second = 2
  }
  
  df_fc <- df %>%
    group_by(.x) %>%
    summarise(mean = mean(.y))
  
  
  result_log_fc = try(log2(df_fc$mean[first]) - log2(df_fc$mean[second]),
                      silent = TRUE)
  
  
  if (!inherits(result_log_fc, 'try-error'))
    log_ratio = result_log_fc
  
  return(data.frame(
    .ri = df$.ri[1],
    .ci = df$.ci[1],
    LogFC = log_ratio
  ))
}

ctx = tercenCtx()

if (!ctx$hasXAxis)
  stop("An x-axis factor is required.")
if (nrow(unique(ctx$select(c('.x')))) != 2)
  stop("Two groups are required on x-axis")

ctx %>%
  select(.ci, .ri, .y, .x) %>%
  group_by(.ci, .ri) %>%
  do(do.fc(., as.logical(ctx$op.value('reverse')))) %>%
  ctx$addNamespace() %>%
  ctx$save()
