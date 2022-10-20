import 'dart:ffi';

class danhsachlop{
  List<hocphan>? list;

  xoa(String ma)
  {
    for(hocphan hp in list!){
      if(hp.malop==ma)
        {
          list?.remove(hp);
        }
    }

  }
}

class hocphan
{
  String _malop="",_tenlop="";
  int _sohocvien=0;


  hocphan(this._malop, this._tenlop, this._sohocvien);

  int get sohocvien => _sohocvien;

  set sohocvien(int value) {
    _sohocvien = value;
  }

  get tenlop => _tenlop;

  set tenlop(value) {
    _tenlop = value;
  }

  String get malop => _malop;

  set malop(String value) {
    _malop = value;
  }


}
