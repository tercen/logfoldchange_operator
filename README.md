# logfoldchange operator

#### Description
`logfoldchange` operator performs a fold change (i.e. ratio) caculation between two values.

##### Usage
Input projection|.
---|---
`x-axis`  | contains the grouping factor for the log2 fold change calculation, 
`y-axis` | values

Input parameter|.
---|---
`reverse`  | logical, to reverse the calculation, default is `FALSE`


Output relations|.
---|---
`logFC`| numeric, logfoldchange calculated per cell

##### Details
A `logfoldchange` operation is performed per cell. Each cell has values defined by the y-axis and seperated by the x-axis. The result of the logfoldchange is the log2 values where of the first is substrated by the second. If reverse is selected then the order of the substraction is changed.


#### References

##### See Also
[ratio](https://github.com/tercen/ratio_operator),[foldchange](https://github.com/tercen/foldchange_operator)
#### Examples
