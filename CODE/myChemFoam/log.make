Making dependency list for source file myChemFoam.C
g++ -std=c++11 -m64 -Dlinux64 -DWM_ARCH_OPTION=64 -DWM_DP -DWM_LABEL_SIZE=32 -Wall -Wextra -Wold-style-cast -Wnon-virtual-dtor -Wno-unused-parameter -Wno-invalid-offsetof -Wno-attributes -O0 -fdefault-inline -ggdb3 -DFULLDEBUG -DNoRepository -ftemplate-depth-100 -I/home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/basic/lnInclude -I/home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/specie/lnInclude -I/home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/reactionThermo/lnInclude -I/home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/solidThermo/lnInclude -I/home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/chemistryModel/lnInclude -I/home/yue/OpenFOAM/OpenFOAM-6/src/transportModels/compressible/lnInclude -I/home/yue/OpenFOAM/OpenFOAM-6/src/ODE/lnInclude -I/home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/chemistryModel/lnInclude -I/home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude -I/home/yue/OpenFOAM/OpenFOAM-6/src/meshTools/lnInclude -I/home/yue/Cases/particleCodeAndExamples/lib/mySolidChemistryModel/lnInclude -I/home/yue/Cases/particleCodeAndExamples/lib/mySolidSpecie/lnInclude  -IlnInclude -I. -I/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude -I/home/yue/OpenFOAM/OpenFOAM-6/src/OSspecific/POSIX/lnInclude   -fPIC -c myChemFoam.C -o Make/linux64GccDPInt32Debug/myChemFoam.o
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBase.H:266,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UListIO.C:29,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.C:233,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:484,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H: In member function ‘Foam::SLListBase::iterator Foam::SLListBase::iterator::operator++(int)’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:218:21: warning: implicitly-declared ‘constexpr Foam::SLListBase::iterator::iterator(const Foam::SLListBase::iterator&)’ is deprecated [-Wdeprecated-copy]
  218 |     iterator tmp = *this;
      |                     ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:174:13: note: because ‘Foam::SLListBase::iterator’ has user-provided ‘void Foam::SLListBase::iterator::operator=(const Foam::SLListBase::iterator&)’
  174 | inline void Foam::SLListBase::iterator::operator=(const iterator& iter)
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:220:12: warning: implicitly-declared ‘constexpr Foam::SLListBase::iterator::iterator(const Foam::SLListBase::iterator&)’ is deprecated [-Wdeprecated-copy]
  220 |     return tmp;
      |            ^~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:174:13: note: because ‘Foam::SLListBase::iterator’ has user-provided ‘void Foam::SLListBase::iterator::operator=(const Foam::SLListBase::iterator&)’
  174 | inline void Foam::SLListBase::iterator::operator=(const iterator& iter)
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H: In member function ‘Foam::SLListBase::iterator Foam::SLListBase::begin()’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:233:16: warning: implicitly-declared ‘constexpr Foam::SLListBase::iterator::iterator(const Foam::SLListBase::iterator&)’ is deprecated [-Wdeprecated-copy]
  233 |         return endIter_;
      |                ^~~~~~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:174:13: note: because ‘Foam::SLListBase::iterator’ has user-provided ‘void Foam::SLListBase::iterator::operator=(const Foam::SLListBase::iterator&)’
  174 | inline void Foam::SLListBase::iterator::operator=(const iterator& iter)
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H: In member function ‘Foam::SLListBase::const_iterator Foam::SLListBase::const_iterator::operator++(int)’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:318:27: warning: implicitly-declared ‘constexpr Foam::SLListBase::const_iterator::const_iterator(const Foam::SLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  318 |     const_iterator tmp = *this;
      |                           ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:265:13: note: because ‘Foam::SLListBase::const_iterator’ has user-provided ‘void Foam::SLListBase::const_iterator::operator=(const Foam::SLListBase::const_iterator&)’
  265 | inline void Foam::SLListBase::const_iterator::operator=
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:320:12: warning: implicitly-declared ‘constexpr Foam::SLListBase::const_iterator::const_iterator(const Foam::SLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  320 |     return tmp;
      |            ^~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:265:13: note: because ‘Foam::SLListBase::const_iterator’ has user-provided ‘void Foam::SLListBase::const_iterator::operator=(const Foam::SLListBase::const_iterator&)’
  265 | inline void Foam::SLListBase::const_iterator::operator=
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H: In member function ‘Foam::SLListBase::const_iterator Foam::SLListBase::cbegin() const’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:333:16: warning: implicitly-declared ‘constexpr Foam::SLListBase::const_iterator::const_iterator(const Foam::SLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  333 |         return endConstIter_;
      |                ^~~~~~~~~~~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:265:13: note: because ‘Foam::SLListBase::const_iterator’ has user-provided ‘void Foam::SLListBase::const_iterator::operator=(const Foam::SLListBase::const_iterator&)’
  265 | inline void Foam::SLListBase::const_iterator::operator=
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/regIOobject.H:41,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/objectRegistry.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IOobject.H: In member function ‘Foam::autoPtr<Foam::IOobject> Foam::IOobject::clone() const’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IOobject.H:273:56: warning: implicitly-declared ‘Foam::IOobject::IOobject(const Foam::IOobject&)’ is deprecated [-Wdeprecated-copy]
  273 |             return autoPtr<IOobject>(new IOobject(*this));
      |                                                        ^
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IOobject.H:492:14: note: because ‘Foam::IOobject’ has user-provided ‘void Foam::IOobject::operator=(const Foam::IOobject&)’
  492 |         void operator=(const IOobject&);
      |              ^~~~~~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBase.H:324,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H: In member function ‘Foam::DLListBase::iterator Foam::DLListBase::iterator::operator++(int)’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:246:21: warning: implicitly-declared ‘constexpr Foam::DLListBase::iterator::iterator(const Foam::DLListBase::iterator&)’ is deprecated [-Wdeprecated-copy]
  246 |     iterator tmp = *this;
      |                     ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:198:13: note: because ‘Foam::DLListBase::iterator’ has user-provided ‘void Foam::DLListBase::iterator::operator=(const Foam::DLListBase::iterator&)’
  198 | inline void Foam::DLListBase::iterator::operator=(const iterator& iter)
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:248:12: warning: implicitly-declared ‘constexpr Foam::DLListBase::iterator::iterator(const Foam::DLListBase::iterator&)’ is deprecated [-Wdeprecated-copy]
  248 |     return tmp;
      |            ^~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:198:13: note: because ‘Foam::DLListBase::iterator’ has user-provided ‘void Foam::DLListBase::iterator::operator=(const Foam::DLListBase::iterator&)’
  198 | inline void Foam::DLListBase::iterator::operator=(const iterator& iter)
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H: In member function ‘Foam::DLListBase::iterator Foam::DLListBase::begin()’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:261:16: warning: implicitly-declared ‘constexpr Foam::DLListBase::iterator::iterator(const Foam::DLListBase::iterator&)’ is deprecated [-Wdeprecated-copy]
  261 |         return endIter_;
      |                ^~~~~~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:198:13: note: because ‘Foam::DLListBase::iterator’ has user-provided ‘void Foam::DLListBase::iterator::operator=(const Foam::DLListBase::iterator&)’
  198 | inline void Foam::DLListBase::iterator::operator=(const iterator& iter)
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H: In member function ‘Foam::DLListBase::const_iterator Foam::DLListBase::const_iterator::operator++(int)’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:345:27: warning: implicitly-declared ‘constexpr Foam::DLListBase::const_iterator::const_iterator(const Foam::DLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  345 |     const_iterator tmp = *this;
      |                           ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:292:13: note: because ‘Foam::DLListBase::const_iterator’ has user-provided ‘void Foam::DLListBase::const_iterator::operator=(const Foam::DLListBase::const_iterator&)’
  292 | inline void Foam::DLListBase::const_iterator::operator=
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:347:12: warning: implicitly-declared ‘constexpr Foam::DLListBase::const_iterator::const_iterator(const Foam::DLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  347 |     return tmp;
      |            ^~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:292:13: note: because ‘Foam::DLListBase::const_iterator’ has user-provided ‘void Foam::DLListBase::const_iterator::operator=(const Foam::DLListBase::const_iterator&)’
  292 | inline void Foam::DLListBase::const_iterator::operator=
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H: In member function ‘Foam::DLListBase::const_iterator Foam::DLListBase::cbegin() const’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:360:16: warning: implicitly-declared ‘constexpr Foam::DLListBase::const_iterator::const_iterator(const Foam::DLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  360 |         return endConstIter_;
      |                ^~~~~~~~~~~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:292:13: note: because ‘Foam::DLListBase::const_iterator’ has user-provided ‘void Foam::DLListBase::const_iterator::operator=(const Foam::DLListBase::const_iterator&)’
  292 | inline void Foam::DLListBase::const_iterator::operator=
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H: In member function ‘Foam::DLListBase::const_reverse_iterator Foam::DLListBase::const_reverse_iterator::operator++(int)’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:452:35: warning: implicitly-declared ‘constexpr Foam::DLListBase::const_reverse_iterator::const_reverse_iterator(const Foam::DLListBase::const_reverse_iterator&)’ is deprecated [-Wdeprecated-copy]
  452 |     const_reverse_iterator tmp = *this;
      |                                   ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:399:13: note: because ‘Foam::DLListBase::const_reverse_iterator’ has user-provided ‘void Foam::DLListBase::const_reverse_iterator::operator=(const Foam::DLListBase::const_reverse_iterator&)’
  399 | inline void Foam::DLListBase::const_reverse_iterator::operator=
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:454:12: warning: implicitly-declared ‘constexpr Foam::DLListBase::const_reverse_iterator::const_reverse_iterator(const Foam::DLListBase::const_reverse_iterator&)’ is deprecated [-Wdeprecated-copy]
  454 |     return tmp;
      |            ^~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:399:13: note: because ‘Foam::DLListBase::const_reverse_iterator’ has user-provided ‘void Foam::DLListBase::const_reverse_iterator::operator=(const Foam::DLListBase::const_reverse_iterator&)’
  399 | inline void Foam::DLListBase::const_reverse_iterator::operator=
      |             ^~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H: In member function ‘Foam::DLListBase::const_reverse_iterator Foam::DLListBase::crbegin() const’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:467:16: warning: implicitly-declared ‘constexpr Foam::DLListBase::const_reverse_iterator::const_reverse_iterator(const Foam::DLListBase::const_reverse_iterator&)’ is deprecated [-Wdeprecated-copy]
  467 |         return endConstRevIter_;
      |                ^~~~~~~~~~~~~~~~
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:399:13: note: because ‘Foam::DLListBase::const_reverse_iterator’ has user-provided ‘void Foam::DLListBase::const_reverse_iterator::operator=(const Foam::DLListBase::const_reverse_iterator&)’
  399 | inline void Foam::DLListBase::const_reverse_iterator::operator=
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/septernion.H:206,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/transformField.H:40,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/vectorTensorTransform.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/mapDistribute.H:138,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshDataTemplates.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshData.H:627,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricBoundaryField.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:1352,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.H:660,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricScalarField.H:38,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricFields.H:34,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/volFields.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.C:27,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.H:307,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolate.H:41,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvc.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:8,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/septernionI.H: In constructor ‘Foam::septernion::septernion(const vector&, const Foam::quaternion&)’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/septernionI.H:34:9: warning: implicitly-declared ‘constexpr Foam::quaternion::quaternion(const Foam::quaternion&)’ is deprecated [-Wdeprecated-copy]
   34 |     r_(r)
      |         ^
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/quaternion.H:304,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/transformField.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/vectorTensorTransform.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/mapDistribute.H:138,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshDataTemplates.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshData.H:627,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricBoundaryField.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:1352,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.H:660,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricScalarField.H:38,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricFields.H:34,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/volFields.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.C:27,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.H:307,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolate.H:41,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvc.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:8,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/quaternionI.H:526:13: note: because ‘Foam::quaternion’ has user-provided ‘void Foam::quaternion::operator=(const Foam::quaternion&)’
  526 | inline void Foam::quaternion::operator=(const quaternion& q)
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/septernion.H:206,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/transformField.H:40,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/vectorTensorTransform.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/mapDistribute.H:138,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshDataTemplates.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshData.H:627,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricBoundaryField.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:1352,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.H:660,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricScalarField.H:38,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricFields.H:34,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/volFields.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.C:27,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.H:307,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolate.H:41,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvc.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:8,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/septernionI.H: In constructor ‘Foam::septernion::septernion(const vector&)’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/septernionI.H:40:21: warning: implicitly-declared ‘constexpr Foam::quaternion::quaternion(const Foam::quaternion&)’ is deprecated [-Wdeprecated-copy]
   40 |     r_(quaternion::I)
      |                     ^
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/quaternion.H:304,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/transformField.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/vectorTensorTransform.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/mapDistribute.H:138,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshDataTemplates.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshData.H:627,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricBoundaryField.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:1352,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.H:660,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricScalarField.H:38,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricFields.H:34,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/volFields.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.C:27,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.H:307,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolate.H:41,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvc.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:8,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/quaternionI.H:526:13: note: because ‘Foam::quaternion’ has user-provided ‘void Foam::quaternion::operator=(const Foam::quaternion&)’
  526 | inline void Foam::quaternion::operator=(const quaternion& q)
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/septernion.H:206,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/transformField.H:40,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/vectorTensorTransform.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/mapDistribute.H:138,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshDataTemplates.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshData.H:627,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricBoundaryField.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:1352,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.H:660,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricScalarField.H:38,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricFields.H:34,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/volFields.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.C:27,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.H:307,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolate.H:41,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvc.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:8,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/septernionI.H: In constructor ‘Foam::septernion::septernion(const Foam::quaternion&)’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/septernionI.H:46:9: warning: implicitly-declared ‘constexpr Foam::quaternion::quaternion(const Foam::quaternion&)’ is deprecated [-Wdeprecated-copy]
   46 |     r_(r)
      |         ^
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/quaternion.H:304,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/transformField.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/vectorTensorTransform.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/mapDistribute.H:138,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshDataTemplates.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/globalMeshData.H:627,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricBoundaryField.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:1352,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.H:660,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricScalarField.H:38,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricFields.H:34,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/volFields.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.C:27,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolationScheme.H:307,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/surfaceInterpolate.H:41,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvc.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:8,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/quaternionI.H:526:13: note: because ‘Foam::quaternion’ has user-provided ‘void Foam::quaternion::operator=(const Foam::quaternion&)’
  526 | inline void Foam::quaternion::operator=(const quaternion& q)
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/specie/lnInclude/specie.H:155,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/specie/lnInclude/thermoPhysicsTypes.H:35,
                 from myChemFoam.C:40:
/home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/specie/lnInclude/specieI.H: In function ‘Foam::specie Foam::operator+(const Foam::specie&, const Foam::specie&)’:
/home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/specie/lnInclude/specieI.H:139:16: warning: implicitly-declared ‘Foam::specie::specie(const Foam::specie&)’ is deprecated [-Wdeprecated-copy]
  139 |         return st1;
      |                ^~~
/home/yue/OpenFOAM/OpenFOAM-6/src/thermophysicalModels/specie/lnInclude/specieI.H:97:13: note: because ‘Foam::specie’ has user-provided ‘void Foam::specie::operator=(const Foam::specie&)’
   97 | inline void specie::operator=(const specie& st)
      |             ^~~~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
readInitialConditions.H: In function ‘int main(int, char**)’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:475:60: warning: implicitly-declared ‘constexpr Foam::DLListBase::iterator::iterator(const Foam::DLListBase::iterator&)’ is deprecated [-Wdeprecated-copy]
  475 |         Container::const_iterator iter = (container).begin();                  \
      |                                                            ^
readInitialConditions.H:48:1: note: in expansion of macro ‘forAllConstIter’
   48 | forAllConstIter(dictionary, solidFractions, iter)
      | ^~~~~~~~~~~~~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBase.H:324,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:198:13: note: because ‘Foam::DLListBase::iterator’ has user-provided ‘void Foam::DLListBase::iterator::operator=(const Foam::DLListBase::iterator&)’
  198 | inline void Foam::DLListBase::iterator::operator=(const iterator& iter)
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/ILList.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H:242:47: note:   initializing argument 1 of ‘Foam::UILList<LListBase, T>::const_iterator::const_iterator(Foam::UILList<LListBase, T>::LListBase_iterator) [with LListBase = Foam::DLListBase; T = Foam::entry; Foam::UILList<LListBase, T>::LListBase_iterator = Foam::DLListBase::iterator]’
  242 |             const_iterator(LListBase_iterator baseIter)
      |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:475:60: warning: implicitly-declared ‘constexpr Foam::DLListBase::iterator::iterator(const Foam::DLListBase::iterator&)’ is deprecated [-Wdeprecated-copy]
  475 |         Container::const_iterator iter = (container).begin();                  \
      |                                                            ^
readInitialConditions.H:68:1: note: in expansion of macro ‘forAllConstIter’
   68 | forAllConstIter(dictionary, gasFractions, iter)
      | ^~~~~~~~~~~~~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBase.H:324,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:198:13: note: because ‘Foam::DLListBase::iterator’ has user-provided ‘void Foam::DLListBase::iterator::operator=(const Foam::DLListBase::iterator&)’
  198 | inline void Foam::DLListBase::iterator::operator=(const iterator& iter)
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/ILList.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H:242:47: note:   initializing argument 1 of ‘Foam::UILList<LListBase, T>::const_iterator::const_iterator(Foam::UILList<LListBase, T>::LListBase_iterator) [with LListBase = Foam::DLListBase; T = Foam::entry; Foam::UILList<LListBase, T>::LListBase_iterator = Foam::DLListBase::iterator]’
  242 |             const_iterator(LListBase_iterator baseIter)
      |                            ~~~~~~~~~~~~~~~~~~~^~~~~~~~
In file included from myChemFoam.C:68:
readInitialConditions.H:159:26: error: invalid use of non-static member function ‘const Foam::word& Foam::IOobject::name() const’
  159 |         Info << "Wg[i] " << Yg[i].name << Wg[i] << endl;
      |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/regIOobject.H:41,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/objectRegistry.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IOobject.H:298:25: note: declared here
  298 |             const word& name() const
      |                         ^~~~
In file included from myChemFoam.C:67:
createFieldRefs.H:1:41: warning: unused variable ‘chemistry’ [-Wunused-variable]
    1 | BasicChemistryModel<rhoReactionThermo>& chemistry = pChemistry();
      |                                         ^~~~~~~~~
createFieldRefs.H:17:21: warning: unused variable ‘compositionS’ [-Wunused-variable]
   17 | basicSpecieMixture& compositionS = thermoS.composition();
      |                     ^~~~~~~~~~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/ILList.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H: In instantiation of ‘Foam::UILList<LListBase, T>::iterator::iterator(Foam::UILList<LListBase, T>::LListBase_iterator) [with LListBase = Foam::DLListBase; T = Foam::entry; Foam::UILList<LListBase, T>::LListBase_iterator = Foam::DLListBase::iterator]’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H:214:37:   required from ‘Foam::UILList<LListBase, T>::iterator Foam::UILList<LListBase, T>::begin() [with LListBase = Foam::DLListBase; T = Foam::entry]’
readInitialConditions.H:48:1:   required from here
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H:189:44: warning: implicitly-declared ‘constexpr Foam::DLListBase::iterator::iterator(const Foam::DLListBase::iterator&)’ is deprecated [-Wdeprecated-copy]
  189 |                 LListBase_iterator(baseIter)
      |                                            ^
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBase.H:324,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:198:13: note: because ‘Foam::DLListBase::iterator’ has user-provided ‘void Foam::DLListBase::iterator::operator=(const Foam::DLListBase::iterator&)’
  198 | inline void Foam::DLListBase::iterator::operator=(const iterator& iter)
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLList.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UListIO.C:29,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.C:233,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:484,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H: In instantiation of ‘Foam::LList<LListBase, T>::const_iterator::const_iterator(Foam::LList<LListBase, T>::LListBase_const_iterator) [with LListBase = Foam::SLListBase; T = int; Foam::LList<LListBase, T>::LListBase_const_iterator = Foam::SLListBase::const_iterator]’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H:346:37:   required from ‘Foam::LList<LListBase, T>::const_iterator Foam::LList<LListBase, T>::begin() const [with LListBase = Foam::SLListBase; T = int]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.C:424:48:   required from ‘void Foam::List<T>::operator=(Foam::SLList<T>&) [with T = int; Foam::SLList<T> = Foam::LList<Foam::SLListBase, int>]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/ListIO.C:144:11:   required from ‘Foam::Istream& Foam::operator>>(Foam::Istream&, Foam::List<T>&) [with T = int]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/faceI.H:162:40:   required from here
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H:302:50: warning: implicitly-declared ‘constexpr Foam::SLListBase::const_iterator::const_iterator(const Foam::SLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  302 |                 LListBase_const_iterator(baseIter)
      |                                                  ^
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBase.H:266,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UListIO.C:29,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.C:233,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:484,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:265:13: note: because ‘Foam::SLListBase::const_iterator’ has user-provided ‘void Foam::SLListBase::const_iterator::operator=(const Foam::SLListBase::const_iterator&)’
  265 | inline void Foam::SLListBase::const_iterator::operator=
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/solverPerformance.H:38,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/data.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvMesh.H:57,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:7,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SolverPerformance.H: In instantiation of ‘void Foam::List<T>::setSize(Foam::label, const T&) [with T = Foam::SolverPerformance<double>; Foam::label = int]’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dataTemplates.C:60:5:   required from ‘void Foam::data::setSolverPerformance(const Foam::word&, const Foam::SolverPerformance<Type>&) const [with Type = double]’
/home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvMatrixSolve.C:272:5:   required from ‘Foam::SolverPerformance<Type> Foam::fvMatrix<Type>::solveCoupled(const Foam::dictionary&) [with Type = double]’
/home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvMatrixSolve.C:86:16:   required from ‘Foam::SolverPerformance<Type> Foam::fvMatrix<Type>::solve(const Foam::dictionary&) [with Type = double]’
rhoSolidEqn.H:12:34:   required from here
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SolverPerformance.H:79:7: warning: implicitly-declared ‘Foam::FixedList<bool, 1>& Foam::FixedList<bool, 1>::operator=(const Foam::FixedList<bool, 1>&)’ is deprecated [-Wdeprecated-copy]
   79 | class SolverPerformance
      |       ^~~~~~~~~~~~~~~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/FixedList.H:381,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.C:28,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:309,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/FixedListI.H:108:8: note: because ‘Foam::FixedList<bool, 1>’ has user-provided ‘Foam::FixedList<T, Size>::FixedList(const Foam::FixedList<T, Size>&) [with T = bool; unsigned int Size = 1]’
  108 | inline Foam::FixedList<T, Size>::FixedList(const FixedList<T, Size>& lst)
      |        ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:309,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.C:336:27: note: synthesized method ‘Foam::SolverPerformance<double>& Foam::SolverPerformance<double>::operator=(const Foam::SolverPerformance<double>&)’ first required here
  336 |         while (i--) *--vv = a;
      |                     ~~~~~~^~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/ILList.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H: In instantiation of ‘Foam::UILList<LListBase, T>::const_iterator::const_iterator(Foam::UILList<LListBase, T>::LListBase_const_iterator) [with LListBase = Foam::DLListBase; T = Foam::entry; Foam::UILList<LListBase, T>::LListBase_const_iterator = Foam::DLListBase::const_iterator]’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H:281:37:   required from ‘Foam::UILList<LListBase, T>::const_iterator Foam::UILList<LListBase, T>::begin() const [with LListBase = Foam::DLListBase; T = Foam::entry]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricBoundaryField.C:54:5:   required from ‘void Foam::GeometricField<Type, PatchField, GeoMesh>::Boundary::readField(const Foam::DimensionedField<TypeR, GeoMesh>&, const Foam::dictionary&) [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:56:5:   required from ‘void Foam::GeometricField<Type, PatchField, GeoMesh>::readFields(const Foam::dictionary&) [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:92:5:   required from ‘void Foam::GeometricField<Type, PatchField, GeoMesh>::readFields() [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:119:9:   required from ‘bool Foam::GeometricField<Type, PatchField, GeoMesh>::readIfPresent() [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:261:5:   required from ‘Foam::GeometricField<Type, PatchField, GeoMesh>::GeometricField(const Foam::IOobject&, const Mesh&, const Foam::dimensioned<Type>&, const Foam::word&) [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh; Foam::GeometricField<Type, PatchField, GeoMesh>::Mesh = Foam::fvMesh]’
./createBaseFields.H:19:5:   required from here
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H:238:50: warning: implicitly-declared ‘constexpr Foam::DLListBase::const_iterator::const_iterator(const Foam::DLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  238 |                 LListBase_const_iterator(baseIter)
      |                                                  ^
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBase.H:324,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:292:13: note: because ‘Foam::DLListBase::const_iterator’ has user-provided ‘void Foam::DLListBase::const_iterator::operator=(const Foam::DLListBase::const_iterator&)’
  292 | inline void Foam::DLListBase::const_iterator::operator=
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/ILList.H:39,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H: In instantiation of ‘Foam::UILList<LListBase, T>::const_reverse_iterator::const_reverse_iterator(typename LListBase::const_reverse_iterator) [with LListBase = Foam::DLListBase; T = Foam::entry; typename LListBase::const_reverse_iterator = Foam::DLListBase::const_reverse_iterator]’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H:345:38:   required from ‘Foam::UILList<LListBase, T>::const_reverse_iterator Foam::UILList<LListBase, T>::rbegin() const [with LListBase = Foam::DLListBase; T = Foam::entry]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricBoundaryField.C:92:70:   required from ‘void Foam::GeometricField<Type, PatchField, GeoMesh>::Boundary::readField(const Foam::DimensionedField<TypeR, GeoMesh>&, const Foam::dictionary&) [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:56:5:   required from ‘void Foam::GeometricField<Type, PatchField, GeoMesh>::readFields(const Foam::dictionary&) [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:92:5:   required from ‘void Foam::GeometricField<Type, PatchField, GeoMesh>::readFields() [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:119:9:   required from ‘bool Foam::GeometricField<Type, PatchField, GeoMesh>::readIfPresent() [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:261:5:   required from ‘Foam::GeometricField<Type, PatchField, GeoMesh>::GeometricField(const Foam::IOobject&, const Mesh&, const Foam::dimensioned<Type>&, const Foam::word&) [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh; Foam::GeometricField<Type, PatchField, GeoMesh>::Mesh = Foam::fvMesh]’
./createBaseFields.H:19:5:   required from here
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UILList.H:306:59: warning: implicitly-declared ‘constexpr Foam::DLListBase::const_reverse_iterator::const_reverse_iterator(const Foam::DLListBase::const_reverse_iterator&)’ is deprecated [-Wdeprecated-copy]
  306 |                 LListBase::const_reverse_iterator(baseIter)
      |                                                           ^
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBase.H:324,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/IDLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/entry.H:45,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionary.H:53,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/baseIOdictionary.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/unwatchedIOdictionary.H:37,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Time.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:6,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DLListBaseI.H:399:13: note: because ‘Foam::DLListBase::const_reverse_iterator’ has user-provided ‘void Foam::DLListBase::const_reverse_iterator::operator=(const Foam::DLListBase::const_reverse_iterator&)’
  399 | inline void Foam::DLListBase::const_reverse_iterator::operator=
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLList.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UListIO.C:29,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.C:233,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:484,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H: In instantiation of ‘Foam::LList<LListBase, T>::const_iterator::const_iterator(Foam::LList<LListBase, T>::LListBase_const_iterator) [with LListBase = Foam::SLListBase; T = Foam::SolverPerformance<double>; Foam::LList<LListBase, T>::LListBase_const_iterator = Foam::SLListBase::const_iterator]’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H:346:37:   required from ‘Foam::LList<LListBase, T>::const_iterator Foam::LList<LListBase, T>::begin() const [with LListBase = Foam::SLListBase; T = Foam::SolverPerformance<double>]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.C:424:48:   required from ‘void Foam::List<T>::operator=(Foam::SLList<T>&) [with T = Foam::SolverPerformance<double>; Foam::SLList<T> = Foam::LList<Foam::SLListBase, Foam::SolverPerformance<double> >]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/ListIO.C:144:11:   required from ‘Foam::Istream& Foam::operator>>(Foam::Istream&, Foam::List<T>&) [with T = Foam::SolverPerformance<double>]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dictionaryTemplates.C:129:28:   required from ‘bool Foam::dictionary::readIfPresent(const Foam::word&, T&, bool, bool) const [with T = Foam::List<Foam::SolverPerformance<double> >]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/dataTemplates.C:56:9:   required from ‘void Foam::data::setSolverPerformance(const Foam::word&, const Foam::SolverPerformance<Type>&) const [with Type = double]’
/home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvMatrixSolve.C:272:5:   required from ‘Foam::SolverPerformance<Type> Foam::fvMatrix<Type>::solveCoupled(const Foam::dictionary&) [with Type = double]’
/home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvMatrixSolve.C:86:16:   required from ‘Foam::SolverPerformance<Type> Foam::fvMatrix<Type>::solve(const Foam::dictionary&) [with Type = double]’
rhoSolidEqn.H:12:34:   required from here
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H:302:50: warning: implicitly-declared ‘constexpr Foam::SLListBase::const_iterator::const_iterator(const Foam::SLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  302 |                 LListBase_const_iterator(baseIter)
      |                                                  ^
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBase.H:266,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UListIO.C:29,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.C:233,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:484,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:265:13: note: because ‘Foam::SLListBase::const_iterator’ has user-provided ‘void Foam::SLListBase::const_iterator::operator=(const Foam::SLListBase::const_iterator&)’
  265 | inline void Foam::SLListBase::const_iterator::operator=
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLList.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UListIO.C:29,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.C:233,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:484,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H: In instantiation of ‘Foam::LList<LListBase, T>::const_iterator::const_iterator(Foam::LList<LListBase, T>::LListBase_const_iterator) [with LListBase = Foam::SLListBase; T = double; Foam::LList<LListBase, T>::LListBase_const_iterator = Foam::SLListBase::const_iterator]’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H:346:37:   required from ‘Foam::LList<LListBase, T>::const_iterator Foam::LList<LListBase, T>::begin() const [with LListBase = Foam::SLListBase; T = double]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.C:424:48:   required from ‘void Foam::List<T>::operator=(Foam::SLList<T>&) [with T = double; Foam::SLList<T> = Foam::LList<Foam::SLListBase, double>]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/ListIO.C:144:11:   required from ‘Foam::Istream& Foam::operator>>(Foam::Istream&, Foam::List<T>&) [with T = double]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Field.C:296:20:   required from ‘Foam::Field<Type>::Field(const Foam::word&, const Foam::dictionary&, Foam::label) [with Type = double; Foam::label = int]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DimensionedFieldIO.C:41:17:   required from ‘void Foam::DimensionedField<Type, GeoMesh>::readField(const Foam::dictionary&, const Foam::word&) [with Type = double; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DimensionedFieldIO.C:59:9:   required from ‘void Foam::DimensionedField<Type, GeoMesh>::readIfPresent(const Foam::word&) [with Type = double; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DimensionedField.C:112:9:   required from ‘Foam::DimensionedField<Type, GeoMesh>::DimensionedField(const Foam::IOobject&, const Mesh&, const Foam::dimensioned<Type>&, bool) [with Type = double; GeoMesh = Foam::volMesh; Foam::DimensionedField<Type, GeoMesh>::Mesh = Foam::fvMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:252:58:   required from ‘Foam::GeometricField<Type, PatchField, GeoMesh>::GeometricField(const Foam::IOobject&, const Mesh&, const Foam::dimensioned<Type>&, const Foam::word&) [with Type = double; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh; Foam::GeometricField<Type, PatchField, GeoMesh>::Mesh = Foam::fvMesh]’
./createBaseFields.H:19:5:   required from here
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H:302:50: warning: implicitly-declared ‘constexpr Foam::SLListBase::const_iterator::const_iterator(const Foam::SLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  302 |                 LListBase_const_iterator(baseIter)
      |                                                  ^
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBase.H:266,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UListIO.C:29,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.C:233,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:484,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:265:13: note: because ‘Foam::SLListBase::const_iterator’ has user-provided ‘void Foam::SLListBase::const_iterator::operator=(const Foam::SLListBase::const_iterator&)’
  265 | inline void Foam::SLListBase::const_iterator::operator=
      |             ^~~~
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLList.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UListIO.C:29,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.C:233,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:484,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H: In instantiation of ‘Foam::LList<LListBase, T>::const_iterator::const_iterator(Foam::LList<LListBase, T>::LListBase_const_iterator) [with LListBase = Foam::SLListBase; T = Foam::Vector<double>; Foam::LList<LListBase, T>::LListBase_const_iterator = Foam::SLListBase::const_iterator]’:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H:346:37:   required from ‘Foam::LList<LListBase, T>::const_iterator Foam::LList<LListBase, T>::begin() const [with LListBase = Foam::SLListBase; T = Foam::Vector<double>]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.C:424:48:   required from ‘void Foam::List<T>::operator=(Foam::SLList<T>&) [with T = Foam::Vector<double>; Foam::SLList<T> = Foam::LList<Foam::SLListBase, Foam::Vector<double> >]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/ListIO.C:144:11:   required from ‘Foam::Istream& Foam::operator>>(Foam::Istream&, Foam::List<T>&) [with T = Foam::Vector<double>]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Field.C:296:20:   required from ‘Foam::Field<Type>::Field(const Foam::word&, const Foam::dictionary&, Foam::label) [with Type = Foam::Vector<double>; Foam::label = int]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DimensionedFieldIO.C:41:17:   required from ‘void Foam::DimensionedField<Type, GeoMesh>::readField(const Foam::dictionary&, const Foam::word&) [with Type = Foam::Vector<double>; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DimensionedFieldIO.C:59:9:   required from ‘void Foam::DimensionedField<Type, GeoMesh>::readIfPresent(const Foam::word&) [with Type = Foam::Vector<double>; GeoMesh = Foam::volMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/DimensionedField.C:112:9:   required from ‘Foam::DimensionedField<Type, GeoMesh>::DimensionedField(const Foam::IOobject&, const Mesh&, const Foam::dimensioned<Type>&, bool) [with Type = Foam::Vector<double>; GeoMesh = Foam::volMesh; Foam::DimensionedField<Type, GeoMesh>::Mesh = Foam::fvMesh]’
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/GeometricField.C:252:58:   required from ‘Foam::GeometricField<Type, PatchField, GeoMesh>::GeometricField(const Foam::IOobject&, const Mesh&, const Foam::dimensioned<Type>&, const Foam::word&) [with Type = Foam::Vector<double>; PatchField = Foam::fvPatchField; GeoMesh = Foam::volMesh; Foam::GeometricField<Type, PatchField, GeoMesh>::Mesh = Foam::fvMesh]’
./createFields.H:81:5:   required from here
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/LList.H:302:50: warning: implicitly-declared ‘constexpr Foam::SLListBase::const_iterator::const_iterator(const Foam::SLListBase::const_iterator&)’ is deprecated [-Wdeprecated-copy]
  302 |                 LListBase_const_iterator(baseIter)
      |                                                  ^
In file included from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBase.H:266,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLList.H:36,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UListIO.C:29,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.C:233,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UList.H:484,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/List.H:43,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/labelList.H:48,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/UPstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/Pstream.H:42,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/parRun.H:35,
                 from /home/yue/OpenFOAM/OpenFOAM-6/src/finiteVolume/lnInclude/fvCFD.H:4,
                 from myChemFoam.C:34:
/home/yue/OpenFOAM/OpenFOAM-6/src/OpenFOAM/lnInclude/SLListBaseI.H:265:13: note: because ‘Foam::SLListBase::const_iterator’ has user-provided ‘void Foam::SLListBase::const_iterator::operator=(const Foam::SLListBase::const_iterator&)’
  265 | inline void Foam::SLListBase::const_iterator::operator=
      |             ^~~~
make: *** [/home/yue/OpenFOAM/OpenFOAM-6/wmake/rules/General/transform:26: Make/linux64GccDPInt32Debug/myChemFoam.o] Error 1
