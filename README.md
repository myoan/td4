## これはなに

[CPUの創りかた](https://www.amazon.co.jp/CPU%E3%81%AE%E5%89%B5%E3%82%8A%E3%81%8B%E3%81%9F-%E6%B8%A1%E6%B3%A2-%E9%83%81/dp/4839909865/ref=sr_1_1?adgrpid=71434361907&gclid=Cj0KCQiA1-3yBRCmARIsAN7B4H3aOIN6RXOu4SEN7CLzNld5j2qjPBQQN2fi5fh0_EBUQh6r8fQhrHQaAmFmEALw_wcB&hvadid=341017304071&hvdev=c&hvlocphy=1009300&hvnetw=g&hvqmt=e&hvrand=4095686081470440513&hvtargid=aud-759377471933%3Akwd-333649630250&hydadcr=15818_11177340&jp-ad-ap=0&keywords=cpu%E3%81%AE%E5%89%B5%E3%82%8A%E3%81%8B%E3%81%9F&qid=1583053387&s=books&sr=1-1)で作成するCPU TD4をverilog HDLで作成したもの


## macでverilog HDLをシュミレートする方法

https://qiita.com/Hiroki11x/items/ec8ce716d3117360313f

## コンパイル方法

```
$ cd td4
$ iverilog -o td4_sim.out td4.v td4_sim.v data_selector.v decoder.v alu.v
$ vvp td4_sim.out
```