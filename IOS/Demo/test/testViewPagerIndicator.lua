--工具包引入
require "kit/lv_kit"


-- 活动指示器
local SCREEN_WIDTH, SCREEN_HEGITH = window.size()

function createSelfDefinedIndicator()
    local indicator = PagerIndicator()
    indicator.size(SCREEN_WIDTH/2, 200)
    indicator.backgroundColor(0x33333333)
    indicator.alignCenter()
    return indicator
end

pagerView = PagerView({
    PageCount = 12,
    Indicator = function()
        return createSelfDefinedIndicator()
    end,
    Pages = {
        Title = function(pos)
            return "Title"
        end,
        Init = function(page, pos)
            page.icon = Button()
        end,
        Layout = function(page, pos)
            page.icon.text("测试按钮"..pos)
            page.icon.frame(0, 0, SCREEN_WIDTH, 200)
        end
    },
    Callback = {
        Scrolling=function(pos, percent, distance)
            Toast("滑动"..pos)
        end,
        Selected=function(pos)
            Toast("选中"..pos)
        end
    }
})
pagerView.frame(0,0,SCREEN_WIDTH, SCREEN_HEGITH);
