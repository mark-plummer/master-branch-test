## Best practices for flexible aggregations

The `group_aggregate` function enables you to calculate a result at a specific aggregation level, and then returns it at a different aggregation level. For this reaggregation result to return correctly, follow these syntax guidelines:

* Wrap `group_aggregate` in an aggregate function, such as `sum` or `average`

* The wrapping function must be the immediate preceding function, such as `sum(group_aggregate(...))`

* Do not use with conditional operators. For example, the following expression does not reaggregate the data because the `if` precedes `group_aggregate`:

  ```
  (if(group_aggregate(...)))
  ```
