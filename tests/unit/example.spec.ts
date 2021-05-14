import { shallowMount } from "@vue/test-utils";
import HomeBodyTop from "@/components/home/HomeBodyTop.vue";

describe("HomeBodyTop.vue", () => {
  it("renders props.msg when passed", () => {
    const msg = "new message";
    const wrapper = shallowMount(HomeBodyTop, {
      propsData: { msg },
    });
    expect(wrapper.text()).toMatch(msg);
  });
});
