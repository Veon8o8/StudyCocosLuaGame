--[[
版权信息.
]]--

-------------------------------------------------------------------------------
-- 测试字符串的单元测试用例.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-06.
-- @module StringUtilTest
StringUtilTest = class("StringUtilTest", function()
    return TestCase:new()
end)

function StringUtilTest.run()
    print("    start StringUtilTest")
    TestCase.runOneTest("StringUtilTest", "testLength", StringUtilTest.testLength)
    TestCase.runOneTest("StringUtilTest", "testTrim", StringUtilTest.testTrim)
    TestCase.runOneTest("StringUtilTest", "testUpper", StringUtilTest.testUpper)
    TestCase.runOneTest("StringUtilTest", "testLower", StringUtilTest.testLower)
    TestCase.runOneTest("StringUtilTest", "testIndexOf", StringUtilTest.testIndexOf)
    TestCase.runOneTest("StringUtilTest", "testLastIndexOf", StringUtilTest.testLastIndexOf)
    TestCase.runOneTest("StringUtilTest", "testSplit", StringUtilTest.testSplit)
    TestCase.runOneTest("StringUtilTest", "testSubstring", StringUtilTest.testSubstring)
    print("    end StringUtilTest\n")
    print("--------------------------------------------------------------------------------\n")
end

-------------------------------------------------------------------------------
-- Test for StringUtil.length(input).
-- @function [parent=#StringUtilTest] testLength
function StringUtilTest.testLength()
    assertEquals(3, StringUtil.length("abc"));
    assertEquals(4, StringUtil.length("abcd"));
end

-------------------------------------------------------------------------------
-- Test for StringUtil.trim(input).
-- @function [parent=#StringUtilTest] testTrim
function StringUtilTest.testTrim()
    assertEquals("abc", StringUtil.trim("  abc "));
    assertEquals("abcd", StringUtil.trim("   abcd  "));
end

-------------------------------------------------------------------------------
-- TODO: Test for StringUtil.upper(input).
-- @function [parent=#StringUtilTest] testUpper
function StringUtilTest.testUpper()
    assertEquals("ABCD", StringUtil.upper("aBcD"));
    assertEquals("1ABCD2", StringUtil.upper("1abcd2"));
end

-------------------------------------------------------------------------------
-- TODO: Test for StringUtil.lower(input).
-- @function [parent=#StringUtilTest] testLower
function StringUtilTest.testLower()
    assertEquals("abcd", StringUtil.lower("aBcD"));
    assertEquals("1abcd2", StringUtil.lower("1ABCD2"));
end

-------------------------------------------------------------------------------
-- Test for StringUtil.indexOf(input, subString).
-- @function [parent=#StringUtilTest] testIndexOf
function StringUtilTest.testIndexOf(input, subString)
    assertEquals(2, StringUtil.indexOf("abcabc", "bc"));
    assertEquals(3, StringUtil.indexOf("abcbcbcbc", "cb"));
end

-------------------------------------------------------------------------------
-- Test for StringUtil.lastIndexOf(input, subString).
-- @function [parent=#StringUtilTest] testLastIndexOf
function StringUtilTest.testLastIndexOf()
    assertEquals(5, StringUtil.lastIndexOf("abcabc", "bc"));
    assertEquals(7, StringUtil.lastIndexOf("abcbcbcbc", "cb"));
end

-------------------------------------------------------------------------------
-- Test for StringUtil.split(szFullString, szSeparator).
-- @function [parent=#StringUtilTest] testSplit
function StringUtilTest.testSplit()
    local arr = StringUtil.split("abc,abd,abf,avt", ",")
    assertEquals(4, table.getn(arr));
    assertEquals("abc", arr[1]);
    assertEquals("abd", arr[2]);
    assertEquals("abf", arr[3]);
    assertEquals("avt", arr[4]);
end

-------------------------------------------------------------------------------
-- Test for StringUtil.substring(input, startIndex, endIndex).
-- @function [parent=#StringUtilTest] testSubstring
function StringUtilTest.testSubstring()
    assertEquals("bca", StringUtil.substring("abcabc", 2, 4));
    assertEquals("cbcb", StringUtil.substring("abcbcbcbc", 5, 8));
end

return StringUtilTest