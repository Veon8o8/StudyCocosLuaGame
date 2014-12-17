--[[
版权信息.
]]--

-------------------------------------------------------------------------------
-- 测试用例的基类.
-- 作者: Andrew Yuan<br>
-- 时间: 2014-12-06.
-- @module TestCase
TestCase = class("TestCase")

testResult = true
gTestClass = ""
gTestMethod = ""
gTestInfo = ""
gTestLineInfo = ""

function TestCase:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function TestCase.setup()
end

function TestCase.tearDown()
end

function TestCase.runOneTest(testClass, testMethod, func)
    gTestClass = testClass
    gTestMethod = testMethod
    gTestInfo = gTestClass.."."..gTestMethod.."()"
    testResult = true
    func()
    if testResult then
        print("[SUCCESS]　"..gTestInfo)
    end
end

-------------------------------------------------------------------------------
-- 断言实际值是否等于期望值.
-- @function [parent=#TestCase] assertEquals
-- @param #any expected 期望值
-- @param #any actual 实际值
function assertEquals(expected, actual)
    local traceTable = StringUtil.split(debug.traceback(), "\n")
    local infoTable = StringUtil.split(StringUtil.trim(traceTable[3]), ":")
    gTestLineInfo = gTestInfo .. "-line[" .. infoTable[2] .. "]"
    if "table" == type(expected) and "table" == type(actual) then
        assertEqualsArray(expected, actual)
    elseif expected ~= actual then
        print(string.format("[FAIL] expected: %s, but actual: %s -- %s", expected, actual, gTestLineInfo))
        testResult = false
    end
end

-------------------------------------------------------------------------------
-- 断言两个数组是否相等.
-- @function [parent=#TestCase] assertEqualsArray
-- @param #any expected 期望数组
-- @param #any actual 实际数组
function assertEqualsArray(expected, actual)
    local eLength = table.getn(expected);
    local aLength = table.getn(actual);
    if eLength ~= aLength then
        print(string.format("[FAIL] expected length: %d, but actual length: %d -- %s", eLength, aLength, gTestLineInfo))
        testResult = false
    else
        for i=1, eLength do
            if expected[i] ~= actual[i] then
                print(string.format("[FAIL] expected[%d]: %s, but actual[%d]: %s -- %s", i, expected[i], i, actual[i], gTestLineInfo))
                testResult = false
        	end
        end
    end
end

return TestCase