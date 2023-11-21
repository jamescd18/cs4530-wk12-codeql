/**
 * @description Find functions that are longer than 10 lines
 * @kind observation
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */

import javascript

/**
 * Holds if a function is longer than 10 lines.
 */
predicate isFunctionLongerThan10Lines(Function func) { func.getNumLines() > 10 }

from Function func
where isFunctionLongerThan10Lines(func)
select func, "is longer than 10 lines"
