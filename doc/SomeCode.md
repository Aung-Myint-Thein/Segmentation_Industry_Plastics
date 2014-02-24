<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<style type="text/css"> body {padding: 10px 30px 10px 30px;} table,th, td {text-align: center;}</style>
<style>
td.tableRow
{
text-align:center;
}
</style>


Market Segmentation for a B2B Company
========================================================

**INSEAD Data Analytics Group Project**


Some Code/Analysis from the course material/tools
---------------------------------------------------------


```
## Error: object 'factor_attributes_used' not found
```

```
## Error: object 'ProjectData' not found
```

```
## Error: object 'ProjectDataFactor' not found
```

```
## Error: object 'ProjectData' not found
```


This is how the first 

```

Error in eval(expr, envir, enclos) : object 'max_data_report' not found

```

 data looks (ignoring the NON-numerical columns):
<br>

<div class="row">
<div class="col-md-6">

```
## Error: object 'ProjectDataFactor' not found
```

```
## Error: object 'show_data' not found
```

```
## Error: object 'show_data' not found
```

```
## Error: object 'show_data' not found
```

```
## Error: object 'dfnew' not found
```

```
## Error: object 'change' not found
```

```
## Error: object 'change' not found
```

```
## Error: could not find function "gvisTable"
```

```
## Error: object 'm1' not found
```

</div>
</div>
<br> <br>


<div class="row">
<div class="col-md-6">

```
Error: could not find function "my_summary"
```

```
Error: object 'show_data' not found
```

```
Error: object 'show_data' not found
```

```
Error: object 'dfnew' not found
```

```
Error: object 'change' not found
```

```
Error: object 'change' not found
```

```
Error: could not find function "gvisTable"
```

```
Error: object 'm1' not found
```

</div>
</div>



```r
ProjectDatafactor_scaled = apply(ProjectDataFactor, 2, function(r) {
    if (sd(r) != 0) 
        res = (r - mean(r))/sd(r) else res = 0 * r
    res
})
```

```
## Error: object 'ProjectDataFactor' not found
```





```
Error: object 'ProjectDataFactor' not found
```

```
Error: object 'ProjectDataFactor' not found
```

```
Error: object 'ProjectDataFactor' not found
```

```
Error: could not find function "renderHeatmapX"
```




```
Error: could not find function "principal"
```

```
Error: object 'UnRotated_Results' not found
```

```
Error: object 'UnRotated_Factors' not found
```

```
Error: object 'UnRotated_Factors' not found
```
















