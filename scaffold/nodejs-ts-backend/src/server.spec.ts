import { calculate } from "./policy"
describe("server", () => {
    it("transforms a ->", () => expect(calculate("a")).toEqual("A"))
})
