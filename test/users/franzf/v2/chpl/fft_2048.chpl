/***************************************************************
This code was generated by  Spiral 5.0 beta, www.spiral.net --
Copyright (c) 2005, Carnegie Mellon University
All rights reserved.
The code is distributed under a BSD style license
(see http://www.opensource.org/licenses/bsd-license.php)

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright
  notice, reference to Spiral, this list of conditions and the
  following disclaimer.
* Redistributions in binary form must reproduce the above
  copyright notice, this list of conditions and the following
  disclaimer in the documentation and/or other materials provided
  with the distribution.
* Neither the name of Carnegie Mellon University nor the name of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
*AS IS* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
******************************************************************/

use omega;
var  buf6: [0..2047] complex;
var  buf7: [0..63] complex;
var  dat6: [0..63] complex;
var  dat7: [0..2047] complex;

def init_fft2048() {
    for i1875 in 0..3 {
        for i1882 in 0..3 {
            for i1892 in 0..1 {
                dat6(((i1875*16) + (i1882*4) + (i1892*2))) = omega(64, ((i1882 + (i1892*4))*i1875));
                dat6(((i1875*16) + (i1882*4) + (i1892*2) + 1)) = omega(64, ((i1882 + (i1892*4) + 8)*i1875));
            }
        }
    }
    for i1873 in 0..31 {
        for i1876 in 0..15 {
            for i1884 in 0..1 {
                dat7(((i1873*64) + (i1876*4) + (i1884*2))) = omega(2048, ((i1876 + (i1884*16))*i1873));
                dat7(((i1873*64) + (i1876*4) + (i1884*2) + 1)) = omega(2048, ((i1876 + (i1884*16) + 32)*i1873));
            }
        }
    }

}

def fft2048(Y: [] complex, X: [] complex) {
    for i1874 in 0..63 {
        var s4237, s4238, s4239, s4240, s4241, s4242, s4243, 
    s4244, s4245, s4246, s4247, s4248, s4249, s4250, s4251, 
    s4252, s4253, s4254, s4255, s4256, s4257, s4258, s4259, 
    s4260, s4261, s4262, s4263, s4264, s4265, s4266, s4267, 
    s4268, s4269, s4270, s4271, s4272, s4273, s4274, s4275, 
    s4276, s4277, s4278, s4279, s4280, s4281, s4282, s4283, 
    s4284, s4285, s4286, s4287, s4288, s4289, s4290, s4291, 
    s4292, s4293, s4294, s4295, s4296, s4297, s4298, s4299, 
    s4300, s4301, s4302, s4303, s4304, s4305, s4306, s4307, 
    s4308, s4309, s4310, s4311, s4312, s4313, s4314, s4315, 
    s4316, s4317, t6983, t6984, t6985, t6986, t6987, t6988, 
    t6989, t6990, t6991, t6992, t6993, t6994, t6995, t6996, 
    t6997, t6998, t6999, t7000, t7001, t7002, t7003, t7004, 
    t7005, t7006, t7007, t7008, t7009, t7010, t7011, t7012, 
    t7013, t7014, t7015, t7016, t7017, t7018, t7019, t7020, 
    t7021, t7022, t7023, t7024, t7025, t7026, t7027, t7028, 
    t7029, t7030, t7031, t7032, t7033, t7034, t7035, t7036, 
    t7037, t7038, t7039, t7040, t7041, t7042, t7043, t7044, 
    t7045, t7046, t7047, t7048, t7049, t7050, t7051, t7052, 
    t7053, t7054, t7055, t7056, t7057, t7058, t7059, t7060, 
    t7061:complex;
        var a4115:int;
        s4237 = X(i1874);
        s4238 = X((1024 + i1874));
        t6983 = (s4237 + s4238);
        t6984 = (s4237 - s4238);
        s4239 = X((512 + i1874));
        s4240 = X((1536 + i1874));
        t6985 = (s4239 + s4240);
        t6986 = (t6983 + t6985);
        t6987 = (t6983 - t6985);
        s4241 = (1.0i*(s4239 - s4240));
        t6988 = (t6984 + s4241);
        t6989 = (t6984 - s4241);
        s4242 = X((256 + i1874));
        s4243 = X((1280 + i1874));
        t6990 = (s4242 + s4243);
        t6991 = (s4242 - s4243);
        s4244 = X((768 + i1874));
        s4245 = X((1792 + i1874));
        t6992 = (s4244 + s4245);
        t6993 = (t6990 + t6992);
        s4246 = (1.0i*(s4244 - s4245));
        t6994 = (t6986 + t6993);
        t6995 = (t6986 - t6993);
        s4247 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(t6991 + s4246));
        t6996 = (t6988 + s4247);
        t6997 = (t6988 - s4247);
        s4248 = (1.0i*(t6990 - t6992));
        t6998 = (t6987 + s4248);
        t6999 = (t6987 - s4248);
        s4249 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(t6991 - s4246));
        t7000 = (t6989 + s4249);
        t7001 = (t6989 - s4249);
        s4250 = X((64 + i1874));
        s4251 = X((1088 + i1874));
        t7002 = (s4250 + s4251);
        t7003 = (s4250 - s4251);
        s4252 = X((576 + i1874));
        s4253 = X((1600 + i1874));
        t7004 = (s4252 + s4253);
        t7005 = (t7002 + t7004);
        t7006 = (t7002 - t7004);
        s4254 = (1.0i*(s4252 - s4253));
        t7007 = (t7003 + s4254);
        t7008 = (t7003 - s4254);
        s4255 = X((320 + i1874));
        s4256 = X((1344 + i1874));
        t7009 = (s4255 + s4256);
        t7010 = (s4255 - s4256);
        s4257 = X((832 + i1874));
        s4258 = X((1856 + i1874));
        t7011 = (s4257 + s4258);
        t7012 = (t7009 + t7011);
        s4259 = (1.0i*(s4257 - s4258));
        t7013 = (t7005 + t7012);
        s4260 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7010 + s4259));
        s4261 = (1.0i*(t7009 - t7011));
        s4262 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7010 - s4259));
        s4263 = X((128 + i1874));
        s4264 = X((1152 + i1874));
        t7014 = (s4263 + s4264);
        t7015 = (s4263 - s4264);
        s4265 = X((640 + i1874));
        s4266 = X((1664 + i1874));
        t7016 = (s4265 + s4266);
        t7017 = (t7014 + t7016);
        t7018 = (t7014 - t7016);
        s4267 = (1.0i*(s4265 - s4266));
        t7019 = (t7015 + s4267);
        t7020 = (t7015 - s4267);
        s4268 = X((384 + i1874));
        s4269 = X((1408 + i1874));
        t7021 = (s4268 + s4269);
        t7022 = (s4268 - s4269);
        s4270 = X((896 + i1874));
        s4271 = X((1920 + i1874));
        t7023 = (s4270 + s4271);
        t7024 = (t7021 + t7023);
        s4272 = (1.0i*(s4270 - s4271));
        t7025 = (t7017 + t7024);
        s4273 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7022 + s4272));
        s4274 = (1.0i*(t7021 - t7023));
        s4275 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7022 - s4272));
        s4276 = X((192 + i1874));
        s4277 = X((1216 + i1874));
        t7026 = (s4276 + s4277);
        t7027 = (s4276 - s4277);
        s4278 = X((704 + i1874));
        s4279 = X((1728 + i1874));
        t7028 = (s4278 + s4279);
        t7029 = (t7026 + t7028);
        t7030 = (t7026 - t7028);
        s4280 = (1.0i*(s4278 - s4279));
        t7031 = (t7027 + s4280);
        t7032 = (t7027 - s4280);
        s4281 = X((448 + i1874));
        s4282 = X((1472 + i1874));
        t7033 = (s4281 + s4282);
        t7034 = (s4281 - s4282);
        s4283 = X((960 + i1874));
        s4284 = X((1984 + i1874));
        t7035 = (s4283 + s4284);
        t7036 = (t7033 + t7035);
        s4285 = (1.0i*(s4283 - s4284));
        t7037 = (t7029 + t7036);
        s4286 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7034 + s4285));
        s4287 = (1.0i*(t7033 - t7035));
        s4288 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7034 - s4285));
        t7038 = (t6994 + t7025);
        t7039 = (t6994 - t7025);
        t7040 = (t7013 + t7037);
        a4115 = (32*i1874);
        buf6(a4115) = (t7038 + t7040);
        buf6((16 + a4115)) = (t7038 - t7040);
        s4289 = (1.0i*(t7013 - t7037));
        buf6((8 + a4115)) = (t7039 + s4289);
        buf6((24 + a4115)) = (t7039 - s4289);
        s4290 = ((0.92387953251128674 + 1.0i * 0.38268343236508978)*(t7019 + s4273));
        t7041 = (t6996 + s4290);
        t7042 = (t6996 - s4290);
        s4291 = ((0.98078528040323043 + 1.0i * 0.19509032201612825)*(t7007 + s4260));
        s4292 = ((0.83146961230254524 + 1.0i * 0.55557023301960218)*(t7031 + s4286));
        t7043 = (s4291 + s4292);
        buf6((1 + a4115)) = (t7041 + t7043);
        buf6((17 + a4115)) = (t7041 - t7043);
        s4293 = (1.0i*(s4291 - s4292));
        buf6((9 + a4115)) = (t7042 + s4293);
        buf6((25 + a4115)) = (t7042 - s4293);
        s4294 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7018 + s4274));
        t7044 = (t6998 + s4294);
        t7045 = (t6998 - s4294);
        s4295 = ((0.92387953251128674 + 1.0i * 0.38268343236508978)*(t7006 + s4261));
        s4296 = ((0.38268343236508978 + 1.0i * 0.92387953251128674)*(t7030 + s4287));
        t7046 = (s4295 + s4296);
        buf6((2 + a4115)) = (t7044 + t7046);
        buf6((18 + a4115)) = (t7044 - t7046);
        s4297 = (1.0i*(s4295 - s4296));
        buf6((10 + a4115)) = (t7045 + s4297);
        buf6((26 + a4115)) = (t7045 - s4297);
        s4298 = ((0.38268343236508978 + 1.0i * 0.92387953251128674)*(t7020 + s4275));
        t7047 = (t7000 + s4298);
        t7048 = (t7000 - s4298);
        s4299 = ((0.83146961230254524 + 1.0i * 0.55557023301960218)*(t7008 + s4262));
        s4300 = ((-0.19509032201612825 + 1.0i * 0.98078528040323043)*(t7032 + s4288));
        t7049 = (s4299 + s4300);
        buf6((3 + a4115)) = (t7047 + t7049);
        buf6((19 + a4115)) = (t7047 - t7049);
        s4301 = (1.0i*(s4299 - s4300));
        buf6((11 + a4115)) = (t7048 + s4301);
        buf6((27 + a4115)) = (t7048 - s4301);
        s4302 = (1.0i*(t7017 - t7024));
        t7050 = (t6995 + s4302);
        t7051 = (t6995 - s4302);
        s4303 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7005 - t7012));
        s4304 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7029 - t7036));
        t7052 = (s4303 + s4304);
        buf6((4 + a4115)) = (t7050 + t7052);
        buf6((20 + a4115)) = (t7050 - t7052);
        s4305 = (1.0i*(s4303 - s4304));
        buf6((12 + a4115)) = (t7051 + s4305);
        buf6((28 + a4115)) = (t7051 - s4305);
        s4306 = ((-0.38268343236508978 + 1.0i * 0.92387953251128674)*(t7019 - s4273));
        t7053 = (t6997 + s4306);
        t7054 = (t6997 - s4306);
        s4307 = ((0.55557023301960218 + 1.0i * 0.83146961230254524)*(t7007 - s4260));
        s4308 = ((-0.98078528040323043 + 1.0i * 0.19509032201612825)*(t7031 - s4286));
        t7055 = (s4307 + s4308);
        buf6((5 + a4115)) = (t7053 + t7055);
        buf6((21 + a4115)) = (t7053 - t7055);
        s4309 = (1.0i*(s4307 - s4308));
        buf6((13 + a4115)) = (t7054 + s4309);
        buf6((29 + a4115)) = (t7054 - s4309);
        s4310 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7018 - s4274));
        t7056 = (t6999 + s4310);
        t7057 = (t6999 - s4310);
        s4311 = ((0.38268343236508978 + 1.0i * 0.92387953251128674)*(t7006 - s4261));
        s4312 = ((-0.92387953251128674 - 1.0i * 0.38268343236508978)*(t7030 - s4287));
        t7058 = (s4311 + s4312);
        buf6((6 + a4115)) = (t7056 + t7058);
        buf6((22 + a4115)) = (t7056 - t7058);
        s4313 = (1.0i*(s4311 - s4312));
        buf6((14 + a4115)) = (t7057 + s4313);
        buf6((30 + a4115)) = (t7057 - s4313);
        s4314 = ((-0.92387953251128674 + 1.0i * 0.38268343236508978)*(t7020 - s4275));
        t7059 = (t7001 + s4314);
        t7060 = (t7001 - s4314);
        s4315 = ((0.19509032201612825 + 1.0i * 0.98078528040323043)*(t7008 - s4262));
        s4316 = ((-0.55557023301960218 - 1.0i * 0.83146961230254524)*(t7032 - s4288));
        t7061 = (s4315 + s4316);
        buf6((7 + a4115)) = (t7059 + t7061);
        buf6((23 + a4115)) = (t7059 - t7061);
        s4317 = (1.0i*(s4315 - s4316));
        buf6((15 + a4115)) = (t7060 + s4317);
        buf6((31 + a4115)) = (t7060 - s4317);
    }
    for i1873 in 0..31 {
        for i1876 in 0..15 {
            var s4336, s4337, s4338, s4339, s4340, t7078, t7079, 
    t7080:complex;
            var a4165, a4166, a4167:int;
            a4165 = (i1873 + (32*i1876));
            a4166 = (4*i1876);
            a4167 = ((64*i1873) + a4166);
            s4336 = (dat7(a4167)*buf6(a4165));
            s4337 = (dat7((a4167 + 1))*buf6((a4165 + 1024)));
            t7078 = (s4336 + s4337);
            t7079 = (s4336 - s4337);
            s4338 = (dat7((a4167 + 2))*buf6((a4165 + 512)));
            s4339 = (dat7((a4167 + 3))*buf6((a4165 + 1536)));
            t7080 = (s4338 + s4339);
            buf7(a4166) = (t7078 + t7080);
            buf7((2 + a4166)) = (t7078 - t7080);
            s4340 = (1.0i*(s4338 - s4339));
            buf7((1 + a4166)) = (t7079 + s4340);
            buf7((3 + a4166)) = (t7079 - s4340);
        }
        for i1875 in 0..3 {
            var s4439, s4440, s4441, s4442, s4443, s4444, s4445, 
    s4446, s4447, s4448, s4449, s4450, s4451, s4452, s4453, 
    s4454, s4455, s4456, s4457, s4458, s4459, s4460, s4461, 
    s4462, s4463, s4464, s4465, s4466, s4467, s4468, s4469, 
    s4470, s4471, t7209, t7210, t7211, t7212, t7213, t7214, 
    t7215, t7216, t7217, t7218, t7219, t7220, t7221, t7222, 
    t7223, t7224, t7225, t7226, t7227, t7228, t7229, t7230, 
    t7231, t7232, t7233, t7234, t7235, t7236, t7237, t7238, 
    t7239:complex;
            var a4326, a4327:int;
            a4326 = (16*i1875);
            s4439 = (dat6(a4326)*buf7(i1875));
            s4440 = (dat6((1 + a4326))*buf7((32 + i1875)));
            t7209 = (s4439 + s4440);
            t7210 = (s4439 - s4440);
            s4441 = (dat6((2 + a4326))*buf7((16 + i1875)));
            s4442 = (dat6((3 + a4326))*buf7((48 + i1875)));
            t7211 = (s4441 + s4442);
            t7212 = (t7209 + t7211);
            t7213 = (t7209 - t7211);
            s4443 = (1.0i*(s4441 - s4442));
            t7214 = (t7210 + s4443);
            t7215 = (t7210 - s4443);
            s4444 = (dat6((4 + a4326))*buf7((4 + i1875)));
            s4445 = (dat6((5 + a4326))*buf7((36 + i1875)));
            t7216 = (s4444 + s4445);
            t7217 = (s4444 - s4445);
            s4446 = (dat6((6 + a4326))*buf7((20 + i1875)));
            s4447 = (dat6((7 + a4326))*buf7((52 + i1875)));
            t7218 = (s4446 + s4447);
            t7219 = (t7216 + t7218);
            s4448 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7216 - t7218));
            s4449 = (1.0i*(s4446 - s4447));
            s4450 = ((0.92387953251128674 + 1.0i * 0.38268343236508978)*(t7217 + s4449));
            s4451 = ((0.38268343236508978 + 1.0i * 0.92387953251128674)*(t7217 - s4449));
            s4452 = (dat6((8 + a4326))*buf7((8 + i1875)));
            s4453 = (dat6((9 + a4326))*buf7((40 + i1875)));
            t7220 = (s4452 + s4453);
            t7221 = (s4452 - s4453);
            s4454 = (dat6((10 + a4326))*buf7((24 + i1875)));
            s4455 = (dat6((11 + a4326))*buf7((56 + i1875)));
            t7222 = (s4454 + s4455);
            t7223 = (t7220 + t7222);
            s4456 = (1.0i*(t7220 - t7222));
            s4457 = (1.0i*(s4454 - s4455));
            s4458 = ((0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7221 + s4457));
            s4459 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7221 - s4457));
            s4460 = (dat6((12 + a4326))*buf7((12 + i1875)));
            s4461 = (dat6((13 + a4326))*buf7((44 + i1875)));
            t7224 = (s4460 + s4461);
            t7225 = (s4460 - s4461);
            s4462 = (dat6((14 + a4326))*buf7((28 + i1875)));
            s4463 = (dat6((15 + a4326))*buf7((60 + i1875)));
            t7226 = (s4462 + s4463);
            t7227 = (t7224 + t7226);
            s4464 = ((-0.70710678118654757 + 1.0i * 0.70710678118654757)*(t7224 - t7226));
            s4465 = (1.0i*(s4462 - s4463));
            s4466 = ((0.38268343236508978 + 1.0i * 0.92387953251128674)*(t7225 + s4465));
            s4467 = ((-0.92387953251128674 - 1.0i * 0.38268343236508978)*(t7225 - s4465));
            t7228 = (t7212 + t7223);
            t7229 = (t7212 - t7223);
            t7230 = (t7219 + t7227);
            a4327 = (i1873 + (32*i1875));
            Y(a4327) = (t7228 + t7230);
            Y((a4327 + 1024)) = (t7228 - t7230);
            s4468 = (1.0i*(t7219 - t7227));
            Y((a4327 + 512)) = (t7229 + s4468);
            Y((a4327 + 1536)) = (t7229 - s4468);
            t7231 = (t7214 + s4458);
            t7232 = (t7214 - s4458);
            t7233 = (s4450 + s4466);
            Y((a4327 + 128)) = (t7231 + t7233);
            Y((a4327 + 1152)) = (t7231 - t7233);
            s4469 = (1.0i*(s4450 - s4466));
            Y((a4327 + 640)) = (t7232 + s4469);
            Y((a4327 + 1664)) = (t7232 - s4469);
            t7234 = (t7213 + s4456);
            t7235 = (t7213 - s4456);
            t7236 = (s4448 + s4464);
            Y((a4327 + 256)) = (t7234 + t7236);
            Y((a4327 + 1280)) = (t7234 - t7236);
            s4470 = (1.0i*(s4448 - s4464));
            Y((a4327 + 768)) = (t7235 + s4470);
            Y((a4327 + 1792)) = (t7235 - s4470);
            t7237 = (t7215 + s4459);
            t7238 = (t7215 - s4459);
            t7239 = (s4451 + s4467);
            Y((a4327 + 384)) = (t7237 + t7239);
            Y((a4327 + 1408)) = (t7237 - t7239);
            s4471 = (1.0i*(s4451 - s4467));
            Y((a4327 + 896)) = (t7238 + s4471);
            Y((a4327 + 1920)) = (t7238 - s4471);
        }
    }

}
