require("./controls.tag")

<stage-list>
    <div class="tev-stage-list">
        <stage each={ stages }></stage>
    </div>

    this.stages = [{stageNumber: 0}];
</stage-list>

<stage>
    <div class="tev-stage">
        <div class="tev-stage-header">
            Stage { stageNumber + 1 } <small class="tev-monospace">(GX_TEVSTAGE{ stageNumber })</small>
        </div>
        <div class="tev-stage-toggles">
            <toggle-button changed={ toggle("color") }>Color operation</toggle-button>
        </div>

        <div if={ this.toggles.color }>
            <div class="row tev-subline">Color operation</div>
            <tev-operation number={ stageNumber } type="color"></tev-operation>
        </div>

        <div class="row tev-subline">Parameters</div>
        <tev-params number={ stageNumber }></tev-params>
    </div>

    this.stageNumber = opts.stageNumber;
    this.toggles = {
        "color": false
    };

    toggle = function(op) {
        return function(enable) {
            this.toggles[op] = enable;
            this.update();
        }
    }
</stage>

<tev-operation>
    <div class="row tev-stage-option">
        <div class="four columns">
            <label for="stage{ stageNumber }_{ type }_Operation">Operation</label>
            <select class="u-full-width tev-monospace" id="stage{ stageNumber }_{ type }_Operation">
                <option value="GX_TEV_ADD">A*(1 - C) + B*C + D</option>
                <option value="GX_TEV_SUB">-A*(1 - C) - B*C + D</option>
                <option value="GX_TEV_COMP_R8_GT">A.r > B.r: C+D else D</option>
                <option value="GX_TEV_COMP_R8_EQ">A.r = B.r: C+D else D</option>
                <option value="GX_TEV_COMP_GR16_GT">A.gr > B.gr: C+D else D</option>
                <option value="GX_TEV_COMP_GR16_EQ">A.gr = B.gr: C+D else D</option>
                <option value="GX_TEV_COMP_BGR24_GT">A.bgr > B.bgr: C+D else D</option>
                <option value="GX_TEV_COMP_BGR24_EQ">A.bgr = B.bgr: C+D else D</option>
                <option value="GX_TEV_COMP_RGB8_GT">A > B: C+D else D (ind)</option>
                <option value="GX_TEV_COMP_RGB8_EQ">A = B: C+D else D (ind)</option>
            </select>
        </div>
        <div class="two columns">
            <label for="stage{ stageNumber }_{ type }_Bias">Bias</label>
            <select class="u-full-width tev-monospace" id="stage{ stageNumber }_{ type }_Bias">
                <option value="GX_TB_ZERO">None</option>
                <option value="GX_TB_ADDHALF">+ 0.5</option>
                <option value="GX_TB_SUBHALF">- 0.5</option>
            </select>
        </div>
        <div class="two columns">
            <label for="stage{ stageNumber }_{ type }_Scale">Scale</label>
            <select class="u-full-width tev-monospace" id="stage{ stageNumber }_{ type }_Scale">
                <option value="GX_CS_SCALE_1">None</option>
                <option value="GX_CS_SCALE_2">x 2</option>
                <option value="GX_CS_SCALE_4">x 4</option>
                <option value="GX_CS_DIVIDE_2">/ 2</option>
            </select>
        </div>
        <div class="two columns">
            <label for="stage{ stageNumber }_{ type }_Clamp">Clamp</label>
            <select class="u-full-width tev-monospace" id="stage{ stageNumber }_{ type }_Clamp">
                <option value="GX_FALSE">No</option>
                <option value="GX_TRUE">Yes</option>
            </select>
        </div>
        <div class="two columns">
            <label for="stage{ stageNumber }_{ type }_Regid">Source</label>
            <select class="u-full-width tev-monospace" id="stage{ stageNumber }_{ type }_Regid">
                <option value="GX_TEVPREV">Prev</option>
                <option value="GX_TEVREG0">Reg 0</option>
                <option value="GX_TEVREG1">Reg 1</option>
                <option value="GX_TEVREG2">Reg 2</option>
            </select>
        </div>
    </div>

    this.stageNumber = opts.stageNumber;
    this.type        = opts.type;
</tev-operation>

<tev-params>
    <div class="row tev-stage-parameters">
        <div class="three columns">
            <center><label for="stage{ stageNumber }_A">A</label></center>
            <color-picker stageNumber={ stageNumber } type="A"></color-picker>
        </div>
        <div class="three columns">
            <center><label for="stage{ stageNumber }_B">B</label></center>
            <color-picker stageNumber={ stageNumber } type="B"></color-picker>
        </div>
        <div class="three columns">
            <center><label for="stage{ stageNumber }_C">C</label></center>
            <color-picker stageNumber={ stageNumber } type="C"></color-picker>
        </div>
        <div class="three columns">
            <center><label for="stage{ stageNumber }_D">D</label></center>
            <color-picker stageNumber={ stageNumber } type="D"></color-picker>
        </div>
    </div>

    this.stageNumber = opts.stageNumber;
</tev-params>

<color-picker>
    <select class="u-full-width tev-monospace" id="stage{ stageNumber }_{ type }">
        <option value="GX_CC_CPREV">Prev (Color)</option>
        <option value="GX_CC_APREV">Prev (Alpha)</option>
        <option value="GX_CC_TEXC">Texture (Color)</option>
        <option value="GX_CC_TEXA">Texture (Alpha)</option>
        <option value="GX_CC_RASC">RAS (Color)</option>
        <option value="GX_CC_RASA">RAS (Alpha)</option>
        <option value="GX_CC_C0">Reg 0 (Color)</option>
        <option value="GX_CC_A0">Reg 0 (Alpha)</option>
        <option value="GX_CC_C1">Reg 1 (Color)</option>
        <option value="GX_CC_A1">Reg 1 (Alpha)</option>
        <option value="GX_CC_C2">Reg 2 (Color)</option>
        <option value="GX_CC_A2">Reg 2 (Alpha)</option>
        <option value="GX_CC_ONE">One (1, 1, 1)</option>
        <option value="GX_CC_HALF">Half (0.5, 0.5, 0.5)</option>
        <option value="GX_CC_ZERO">Zero (0, 0, 0)</option>
        <option value="GX_CC_KONST">Constant (KCOL)</option>
    </select>

    this.stageNumber = opts.stageNumber;
    this.type        = opts.type;
</color-picker>