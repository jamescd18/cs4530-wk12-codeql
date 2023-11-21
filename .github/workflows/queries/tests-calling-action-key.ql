/**
 * @description Find tests calling the action key function
 * @kind problem
 * @id javascript/tests-calling-action-key
 * @problem.severity recommendation
 */

import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
 * Holds if `caller` contains a call to `callee`.
 */
predicate callsActionKey(Function test) {
  exists(DataFlow::CallNode call |
    call.getEnclosingFunction() = test and
    call.getACallee().getName() = "pressActionKey"
  )
}

from Function test
where
  isTest(test) and
  callsActionKey(test)
select test, "calls pressActionKey"
