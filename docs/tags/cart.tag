<!-- Custom DOM Definition. -->
<cart class={ displayed: true } ref="flux_cart">

  <!-- Insert Components / Layout -->
  <inner each={ list }>
    <imgbox><img src="{ img }"></imgbox>
    <pdname>{ name }</pdname>
    <totalprice>
      <span id="totalPrice">Total Price</span>¥
      <span class={ addComma: true }>0</span><span class={ checkPrice: true }>{ price }</span></totalprice>
    <count>
      <span>Total Number</span>{ total }</count>
    <button onclick={ reset } disabled={ total==0 } ="}">Reset</button>
  </inner>
  <!-- Insert Components End. -->

  <!-- CSS Definition. Using Sass. -->
  <style type="scss">
    :scope {
      display: inline-block;
      width: 50%;
      padding: 0 0 0 10px;
      text-align: center;
      color: #999999;
      transform: translate(25%,0);
      opacity: 0;
      @media screen and (-webkit-min-device-pixel-ratio:0) {
        /* Safari Hack */
        height: 500px;
      }
      @media all and (-webkit-min-device-pixel-ratio:0) and (min-resolution: .001dpcm) {
        /* Chrome Hack */
        height: auto;
      }
      &.on {
        transition: all 0.5s ease-out 0.5s;
        transform: translate(0,0);
        opacity: 1;
      }
      inner {
        background-color: #fff;
        border-left: solid 5px #999999;
        border-right: solid 5px #999999;
        box-sizing: border-box;
        display: block;
        height: 100%;
        @media screen and (-webkit-min-device-pixel-ratio:0) {
          /* Safari Hack */
          padding-bottom: 60px;
        }
        @media all and (-webkit-min-device-pixel-ratio:0) and (min-resolution: .001dpcm) {
          /* Chrome Hack */
          padding-bottom: 0;
        }
        imgbox {
          width: 100%;
          display: block;
          height: 330px;
          line-height: 300px;
          text-align: center;
          padding: 20px 0;
          img {
            height: 100%;
            vertical-align: top;
          }
        }
        pdname {
          display: block;
          font-size: 28px;
          margin: 0 0 8px;
          letter-spacing: 0.03em;
          font-style: italic;
        }
        totalprice {
          display: block;
          font-size: 22px;
          margin: 0 0 8px;
          span {
            &#totalPrice {
              font-size: 18px;
              margin: 0 8px 0 0;
            }
            &.addComma {
              font-size: 22px;
            }
            &.checkPrice {
              display: inline-block;
              width: 0;
              height: 0;
              opacity: 0;
            }
          }
        }
        count {
          display: block;
          font-size: 20px;
          font-weight: bold;
          margin: 0 0 8px;
          span {
            font-size: 16px;
            margin: 0 8px 0 0;
            font-weight: normal;
          }
        }
        button {
          cursor: pointer;
          border: none;
          border-radius: 6px;
          width: 300px;
          height: 36px;
          color: #fff;
          background-color: #999999;
          font-size: 18px;
          padding: 0;
          margin: 10px 0 0;
          transform: scale(1);
          transition: transform 0.25s;
          &:focus {
            outline: none;
          }
          &:active {
            transform: scale(0.95);
            transition: transform 0.25s;
          }
          &:disabled {
            cursor: default;
            opacity: 1;
            background-color: #fff;
            border: solid 2px #999999;
            color: #999999;
            position: relative;
            transform: scale(0.9);
            transition: transform 0.5s;
            &:after {
              display: inline-block;
              content: " ";
              width: 100px;
              border-bottom: solid 2px #999999;
              position: absolute;
              left: 50%;
              top: 50%;
              transform: translate(-50%, -50%);
              opacity: 0.6;
            }
          }

        }
      }
    }
  </style>
  <!-- CSS End. -->

  <!-- JavaScript / Logic -->
  <script>
    // Require Actions.js
    import TodoAction from '../js/flux/actions'
    import TodoStore from '../js/flux/stores'
    import RiotControl from 'riotcontrol'
    let cart = this

    cart.list = []

    RiotControl.on('changes_cart', (list) => {
      cart.list = list
      cart.update()
    });

    this.on('mount', () => {
      TodoAction.initCart()
    });

    this.reset = () => {
      TodoAction.resetCart()
    }
  </script>
  <!-- JavaScript End. -->

</cart>
<!-- Custom DOM End. -->