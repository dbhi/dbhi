<template>
  <div
    class="home"
    style="width=100%; height: 100%; display: flex; flex-direction: column;"
  >
    <div style="width=100%; height: 100%; display: flex; flex-grow: 1;">
      <div
        class="level"
        style="width: 55%; height: 100%; background-color: #ec563c"
      >
        <div class="level-left"></div>
        <div class="level-right">
          <div
            class="level-item"
            style="
              font-size: 12rem;
              font-family: BigJohnPROBold;
              padding-right: 2rem;
            "
          >
            DBHI
          </div>
        </div>
      </div>
      <div
        class="level"
        style="width: 45%; height: 100%; background-color: #f2f1ef"
      >
        <div class="level-left">
          <div
            class="level-item"
            style="
              font-family: BigJohnPRORegular;
              letter-spacing: 1.25rem;
              flex-direction: column;
              align-items: baseline;
              padding-left: 3rem;
              font-size: 2.25rem;
            "
          >
            <p>Dynamic</p>
            <p>Binary</p>
            <p>Hardware</p>
            <p>Injection</p>
          </div>
        </div>
        <div class="level-right"></div>
      </div>
    </div>
    <div style="width=100%; height: 15%; display: flex;">
      <div style="width: 55%; height: 100%; background-color: #ec563c"></div>
      <div style="width: 45%; height: 100%; background-color: #f2f1ef"></div>
    </div>
    <div
      class="title is-4"
      style="
        position: fixed;
        bottom: 20%;
        width: 100%;
        font-family: BigJohnPRORegular;
      "
    >
      Decoupled functional hardware-software co-design on SoCs with FPGA, using
      dynamic binary modification to inject compiled HDL designs.
    </div>
  </div>
</template>
