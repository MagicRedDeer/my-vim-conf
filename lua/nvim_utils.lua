print 'utils_loaded'

local function test_me (a)
    print("test me was called", a)
end

return {
    test_me = test_me
}
