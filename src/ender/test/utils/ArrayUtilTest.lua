--[[
版权信息.
]]--

-------------------------------------------------------------------------------
-- 测试数组的单元测试用例.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-06.
-- @module ArrayUtilTest
ArrayUtilTest = class("ArrayUtilTest", function()
    return TestCase:new()
end)

function ArrayUtilTest.run()
    print("    start ArrayUtilTest")
    TestCase.runOneTest("ArrayUtilTest", "testSize", ArrayUtilTest.testSize)
    TestCase.runOneTest("ArrayUtilTest", "testMax", ArrayUtilTest.testMax)
    TestCase.runOneTest("ArrayUtilTest", "testMin", ArrayUtilTest.testMin)
    TestCase.runOneTest("ArrayUtilTest", "testFill", ArrayUtilTest.testFill)
    TestCase.runOneTest("ArrayUtilTest", "testInit", ArrayUtilTest.testInit)
    TestCase.runOneTest("ArrayUtilTest", "testSort", ArrayUtilTest.testSort)
    TestCase.runOneTest("ArrayUtilTest", "testToString", ArrayUtilTest.testToString)
    print("    end ArrayUtilTest\n")
    print("--------------------------------------------------------------------------------\n")
end

-------------------------------------------------------------------------------
-- Test for ArrayUtil.size(input).
-- @function [parent=#ArrayUtilTest] testSize
function ArrayUtilTest.testSize()
    assertEquals(5, ArrayUtil.size({1,2,3,4,5}));
    assertEquals(3, ArrayUtil.size({"abcd","234","dfe4"}));
end

-------------------------------------------------------------------------------
-- Test for ArrayUtil.max(input).
-- @function [parent=#ArrayUtilTest] testMax
function ArrayUtilTest.testMax()
    assertEquals(6, ArrayUtil.max({1,2,3,6,5}));
    assertEquals(90, ArrayUtil.max({12,30,90,44}));
end

-------------------------------------------------------------------------------
-- Test for ArrayUtil.min(input).
-- @function [parent=#ArrayUtilTest] testMin
function ArrayUtilTest.testMin()
    assertEquals(1, ArrayUtil.min({1,2,3,6,5}));
    assertEquals(12, ArrayUtil.min({12,30,90,44}));
end

-------------------------------------------------------------------------------
-- Test for ArrayUtil.fill(input, val).
-- @function [parent=#ArrayUtilTest] testFill
function ArrayUtilTest.testFill()
    assertEquals({1,1,1}, ArrayUtil.fill({1,2,3}, 1));
    assertEquals({2,2,2,2,2}, ArrayUtil.fill({1,2,3,4,5}, 2));
    assertEquals({1,2,5,5,5}, ArrayUtil.fill({1,2,3,4,5}, 5, 3));
    assertEquals({1,2,5,5,6}, ArrayUtil.fill({1,2,3,4,6}, 5, 3, 4));
    assertEquals({1,2,5,5,5}, ArrayUtil.fill({1,2,3,4,6}, 5, 3, 10));
end

-------------------------------------------------------------------------------
-- Test for ArrayUtil.init(input, val).
-- @function [parent=#ArrayUtilTest] testInit
function ArrayUtilTest.testInit()
    assertEquals({1,1,1}, ArrayUtil.init({}, 1, 3));
    assertEquals({"abc","abc","abc"}, ArrayUtil.init({}, "abc", 3));
    assertEquals({1,1,1,1,1}, ArrayUtil.init({}, 1, 5));
end

-------------------------------------------------------------------------------
-- Test for ArrayUtil.sort(input).
-- @function [parent=#ArrayUtilTest] testSort
function ArrayUtilTest.testSort()
    assertEquals({1,2,3}, ArrayUtil.sort({1,3,2}));
    assertEquals({1,1,2,3,5,6}, ArrayUtil.sort({1,3,2,6,5,1}));
    assertEquals({"a","b","v"}, ArrayUtil.sort({"a","v","b"}));
end

-------------------------------------------------------------------------------
-- Test for ArrayUtil.toString(input).
-- @function [parent=#ArrayUtilTest] testToString
function ArrayUtilTest.testToString()
    assertEquals("1,3,2", ArrayUtil.toString({1,3,2}));
    assertEquals("a,v,b", ArrayUtil.toString({"a","v","b"}));
end

return ArrayUtilTest