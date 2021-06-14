" Tests for the Blob types

source vim9.vim

func TearDown()
  " Run garbage collection after every test
  call test_garbagecollect_now()
endfunc

" Tests for Blob type

" Blob creation from constant
func Test_blob_create()
  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call assert_equal(v:t_blob, type(b))
      call assert_equal(4, len(b))
      call assert_equal(0xDE, b[0])
      call assert_equal(0xAD, b[1])
      call assert_equal(0xBE, b[2])
      call assert_equal(0xEF, b[3])
      call assert_fails('VAR x = b[4]')

      call assert_equal(0xDE, get(b, 0))
      call assert_equal(0xEF, get(b, 3))

      call assert_fails('VAR b = 0z1', 'E973:')
      call assert_fails('VAR b = 0z1x', 'E973:')
      call assert_fails('VAR b = 0z12345', 'E973:')

      call assert_equal(0z, test_null_blob())

      LET b = 0z001122.33445566.778899.aabbcc.dd
      call assert_equal(0z00112233445566778899aabbccdd, b)
      call assert_fails('VAR b = 0z1.1')
      call assert_fails('VAR b = 0z.')
      call assert_fails('VAR b = 0z001122.')
      call assert_fails('call get("", 1)', 'E896:')
      call assert_equal(0, len(test_null_blob()))
  END
  call CheckLegacyAndVim9Success(lines)
endfunc

" assignment to a blob
func Test_blob_assign()
  let lines =<< trim END
      VAR b = 0zDEADBEEF
      VAR b2 = b[1 : 2]
      call assert_equal(0zADBE, b2)

      VAR bcopy = b[:]
      call assert_equal(b, bcopy)
      call assert_false(b is bcopy)

      LET b = 0zDEADBEEF
      LET b2 = b
      call assert_true(b is b2)
      LET b[:] = 0z11223344
      call assert_equal(0z11223344, b)
      call assert_equal(0z11223344, b2)
      call assert_true(b is b2)

      LET b = 0zDEADBEEF
      LET b[3 :] = 0z66
      call assert_equal(0zDEADBE66, b)
      LET b[: 1] = 0z8899
      call assert_equal(0z8899BE66, b)

      LET b = 0zDEADBEEF
      LET b += 0z99
      call assert_equal(0zDEADBEEF99, b)

      VAR l = [0z12]
      VAR m = deepcopy(l)
      LET m[0] = 0z34	#" E742 or E741 should not occur.
  END
  call CheckLegacyAndVim9Success(lines)

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      LET b[2 : 3] = 0z112233
  END
  call CheckLegacyAndVim9Failure(lines, 'E972:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      LET b[2 : 3] = 0z11
  END
  call CheckLegacyAndVim9Failure(lines, 'E972:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      LET b[3 : 2] = 0z
  END
  call CheckLegacyAndVim9Failure(lines, 'E979:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      LET b ..= 0z33
  END
  call CheckLegacyAndVim9Failure(lines, ['E734:', 'E1019:', 'E734:'])

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      LET b ..= "xx"
  END
  call CheckLegacyAndVim9Failure(lines, ['E734:', 'E1019:', 'E734:'])

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      LET b += "xx"
  END
  call CheckLegacyAndVim9Failure(lines, ['E734:', 'E1012:', 'E734:'])

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      LET b[1 : 1] ..= 0z55
  END
  call CheckLegacyAndVim9Failure(lines, ['E734:', 'E1183:', 'E734:'])
endfunc

func Test_blob_get_range()
  let lines =<< trim END
      VAR b = 0z0011223344
      call assert_equal(0z2233, b[2 : 3])
      call assert_equal(0z223344, b[2 : -1])
      call assert_equal(0z00, b[0 : -5])
      call assert_equal(0z, b[0 : -11])
      call assert_equal(0z44, b[-1 :])
      call assert_equal(0z0011223344, b[:])
      call assert_equal(0z0011223344, b[: -1])
      call assert_equal(0z, b[5 : 6])
      call assert_equal(0z0011, b[-10 : 1])
  END
  call CheckLegacyAndVim9Success(lines)

  " legacy script white space
  let b = 0z0011223344
  call assert_equal(0z2233, b[2:3])
endfunc

func Test_blob_get()
  let lines =<< trim END
      VAR b = 0z0011223344
      call assert_equal(0x00, get(b, 0))
      call assert_equal(0x22, get(b, 2, 999))
      call assert_equal(0x44, get(b, 4))
      call assert_equal(0x44, get(b, -1))
      call assert_equal(-1, get(b, 5))
      call assert_equal(999, get(b, 5, 999))
      call assert_equal(-1, get(b, -8))
      call assert_equal(999, get(b, -8, 999))
      call assert_equal(10, get(test_null_blob(), 2, 10))

      call assert_equal(0x00, b[0])
      call assert_equal(0x22, b[2])
      call assert_equal(0x44, b[4])
      call assert_equal(0x44, b[-1])
  END
  call CheckLegacyAndVim9Success(lines)

  let lines =<< trim END
      VAR b = 0z0011223344
      echo b[5]
  END
  call CheckLegacyAndVim9Failure(lines, 'E979:')

  let lines =<< trim END
      VAR b = 0z0011223344
      echo b[-8]
  END
  call CheckLegacyAndVim9Failure(lines, 'E979:')
endfunc

func Test_blob_to_string()
  let lines =<< trim END
      VAR b = 0z00112233445566778899aabbccdd
      call assert_equal('0z00112233.44556677.8899AABB.CCDD', string(b))
      call assert_equal(b, eval(string(b)))
      call remove(b, 4, -1)
      call assert_equal('0z00112233', string(b))
      call remove(b, 0, 3)
      call assert_equal('0z', string(b))
      call assert_equal('0z', string(test_null_blob()))
  END
  call CheckLegacyAndVim9Success(lines)
endfunc

func Test_blob_compare()
  let lines =<< trim END
      VAR b1 = 0z0011
      VAR b2 = 0z1100
      VAR b3 = 0z001122
      call assert_true(b1 == b1)
      call assert_false(b1 == b2)
      call assert_false(b1 == b3)
      call assert_true(b1 != b2)
      call assert_true(b1 != b3)
      call assert_true(b1 == 0z0011)

      call assert_false(b1 is b2)
      LET b2 = b1
      call assert_true(b1 == b2)
      call assert_true(b1 is b2)
      LET b2 = copy(b1)
      call assert_true(b1 == b2)
      call assert_false(b1 is b2)
      LET b2 = b1[:]
      call assert_true(b1 == b2)
      call assert_false(b1 is b2)
      call assert_true(b1 isnot b2)
  END
  call CheckLegacyAndVim9Success(lines)

  let lines =<< trim END
      VAR b1 = 0z0011
      echo b1 == 9
  END
  call CheckLegacyAndVim9Failure(lines, ['E977:', 'E1072', 'E1072'])

  let lines =<< trim END
      VAR b1 = 0z0011
      echo b1 != 9
  END
  call CheckLegacyAndVim9Failure(lines, ['E977:', 'E1072', 'E1072'])

  let lines =<< trim END
      VAR b1 = 0z0011
      VAR b2 = 0z1100
      VAR x = b1 > b2
  END
  call CheckLegacyAndVim9Failure(lines, ['E978:', 'E1072:', 'E1072:'])

  let lines =<< trim END
      VAR b1 = 0z0011
      VAR b2 = 0z1100
      VAR x = b1 < b2
  END
  call CheckLegacyAndVim9Failure(lines, ['E978:', 'E1072:', 'E1072:'])

  let lines =<< trim END
      VAR b1 = 0z0011
      VAR b2 = 0z1100
      VAR x = b1 - b2
  END
  call CheckLegacyAndVim9Failure(lines, ['E974:', 'E1036:', 'E974:'])

  let lines =<< trim END
      VAR b1 = 0z0011
      VAR b2 = 0z1100
      VAR x = b1 / b2
  END
  call CheckLegacyAndVim9Failure(lines, ['E974:', 'E1036:', 'E974:'])

  let lines =<< trim END
      VAR b1 = 0z0011
      VAR b2 = 0z1100
      VAR x = b1 * b2
  END
  call CheckLegacyAndVim9Failure(lines, ['E974:', 'E1036:', 'E974:'])
endfunc

func Test_blob_index_assign()
  let lines =<< trim END
      VAR b = 0z00
      LET b[1] = 0x11
      LET b[2] = 0x22
      call assert_equal(0z001122, b)
  END
  call CheckLegacyAndVim9Success(lines)

  let lines =<< trim END
      VAR b = 0z00
      LET b[2] = 0x33
  END
  call CheckLegacyAndVim9Failure(lines, 'E979:')

  let lines =<< trim END
      VAR b = 0z00
      LET b[-2] = 0x33
  END
  call CheckLegacyAndVim9Failure(lines, 'E979:')
endfunc

func Test_blob_for_loop()
  let lines =<< trim END
      VAR blob = 0z00010203
      VAR i = 0
      for byte in blob
        call assert_equal(i, byte)
        LET i += 1
      endfor
      call assert_equal(4, i)

      LET blob = 0z00
      call remove(blob, 0)
      call assert_equal(0, len(blob))
      for byte in blob
        call assert_report('loop over empty blob')
      endfor

      LET blob = 0z0001020304
      LET i = 0
      for byte in blob
        call assert_equal(i, byte)
        if i == 1
          call remove(blob, 0)
        elseif i == 3
          call remove(blob, 3)
        endif
        LET i += 1
      endfor
      call assert_equal(5, i)
  END
  call CheckLegacyAndVim9Success(lines)
endfunc

func Test_blob_concatenate()
  let lines =<< trim END
      VAR b = 0z0011
      LET b += 0z2233
      call assert_equal(0z00112233, b)

      LET b = 0zDEAD + 0zBEEF
      call assert_equal(0zDEADBEEF, b)
  END
  call CheckLegacyAndVim9Success(lines)

  let lines =<< trim END
      VAR b = 0z0011
      LET b += "a"
  END
  call CheckLegacyAndVim9Failure(lines, ['E734:', 'E1012:', 'E734:'])

  let lines =<< trim END
      VAR b = 0z0011
      LET b += 88
  END
  call CheckLegacyAndVim9Failure(lines, ['E734:', 'E1012:', 'E734:'])
endfunc

func Test_blob_add()
  let lines =<< trim END
      VAR b = 0z0011
      call add(b, 0x22)
      call assert_equal(0z001122, b)
  END
  call CheckLegacyAndVim9Success(lines)

  " Only works in legacy script
  let b = 0z0011
  call add(b, '51')
  call assert_equal(0z001133, b)
  call assert_equal(1, add(test_null_blob(), 0x22))

  let lines =<< trim END
      VAR b = 0z0011
      call add(b, [9])
  END
  call CheckLegacyAndVim9Failure(lines, ['E745:', 'E1012:', 'E745:'])

  let lines =<< trim END
      VAR b = 0z0011
      call add("", 0x01)
  END
  call CheckLegacyAndVim9Failure(lines, 'E897:')

  let lines =<< trim END
      add(test_null_blob(), 0x22)
  END
  call CheckDefExecAndScriptFailure(lines, 'E1131:')
endfunc

func Test_blob_empty()
  call assert_false(empty(0z001122))
  call assert_true(empty(0z))
  call assert_true(empty(test_null_blob()))
endfunc

" Test removing items in blob
func Test_blob_func_remove()
  let lines =<< trim END
      #" Test removing 1 element
      VAR b = 0zDEADBEEF
      call assert_equal(0xDE, remove(b, 0))
      call assert_equal(0zADBEEF, b)

      LET b = 0zDEADBEEF
      call assert_equal(0xEF, remove(b, -1))
      call assert_equal(0zDEADBE, b)

      LET b = 0zDEADBEEF
      call assert_equal(0xAD, remove(b, 1))
      call assert_equal(0zDEBEEF, b)

      #" Test removing range of element(s)
      LET b = 0zDEADBEEF
      call assert_equal(0zBE, remove(b, 2, 2))
      call assert_equal(0zDEADEF, b)

      LET b = 0zDEADBEEF
      call assert_equal(0zADBE, remove(b, 1, 2))
      call assert_equal(0zDEEF, b)
  END
  call CheckLegacyAndVim9Success(lines)

  " Test invalid cases
  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call remove(b, 5)
  END
  call CheckLegacyAndVim9Failure(lines, 'E979:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call remove(b, 1, 5)
  END
  call CheckLegacyAndVim9Failure(lines, 'E979:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call remove(b, 3, 2)
  END
  call CheckLegacyAndVim9Failure(lines, 'E979:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call remove(1, 0)
  END
  call CheckLegacyAndVim9Failure(lines, 'E896:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call remove(b, b)
  END
  call CheckLegacyAndVim9Failure(lines, 'E974:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call remove(b, 1, [])
  END
  call CheckLegacyAndVim9Failure(lines, 'E745:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call remove(test_null_blob(), 1, 2)
  END
  call CheckLegacyAndVim9Failure(lines, 'E979:')
endfunc

func Test_blob_read_write()
  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call writefile(b, 'Xblob')
      VAR br = readfile('Xblob', 'B')
      call assert_equal(b, br)
      call delete('Xblob')
  END
  call CheckLegacyAndVim9Success(lines)

  " This was crashing when calling readfile() with a directory.
  call assert_fails("call readfile('.', 'B')", 'E17: "." is a directory')
endfunc

" filter() item in blob
func Test_blob_filter()
  let lines =<< trim END
      call assert_equal(test_null_blob(), filter(test_null_blob(), '0'))
      call assert_equal(0z, filter(0zDEADBEEF, '0'))
      call assert_equal(0zADBEEF, filter(0zDEADBEEF, 'v:val != 0xDE'))
      call assert_equal(0zDEADEF, filter(0zDEADBEEF, 'v:val != 0xBE'))
      call assert_equal(0zDEADBE, filter(0zDEADBEEF, 'v:val != 0xEF'))
      call assert_equal(0zDEADBEEF, filter(0zDEADBEEF, '1'))
      call assert_equal(0z01030103, filter(0z010203010203, 'v:val != 0x02'))
      call assert_equal(0zADEF, filter(0zDEADBEEF, 'v:key % 2'))
  END
  call CheckLegacyAndVim9Success(lines)
endfunc

" map() item in blob
func Test_blob_map()
  let lines =<< trim END
      call assert_equal(0zDFAEBFF0, map(0zDEADBEEF, 'v:val + 1'))
      call assert_equal(0z00010203, map(0zDEADBEEF, 'v:key'))
      call assert_equal(0zDEAEC0F2, map(0zDEADBEEF, 'v:key + v:val'))
  END
  call CheckLegacyAndVim9Success(lines)

  let lines =<< trim END
      call map(0z00, '[9]')
  END
  call CheckLegacyAndVim9Failure(lines, 'E978:')
endfunc

func Test_blob_index()
  let lines =<< trim END
      call assert_equal(2, index(0zDEADBEEF, 0xBE))
      call assert_equal(-1, index(0zDEADBEEF, 0))
      call assert_equal(2, index(0z11111111, 0x11, 2))
      call assert_equal(3, 0z11110111->index(0x11, 2))
      call assert_equal(2, index(0z11111111, 0x11, -2))
      call assert_equal(3, index(0z11110111, 0x11, -2))
      call assert_equal(0, index(0z11110111, 0x11, -10))
      call assert_equal(-1, index(test_null_blob(), 1))
  END
  call CheckLegacyAndVim9Success(lines)

  let lines =<< trim END
      echo index(0z11110111, 0x11, [])
  END
  call CheckLegacyAndVim9Failure(lines, 'E745:')

  let lines =<< trim END
      call index("asdf", 0)
  END
  call CheckLegacyAndVim9Failure(lines, 'E897:')
endfunc

func Test_blob_insert()
  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call insert(b, 0x33)
      call assert_equal(0z33DEADBEEF, b)

      LET b = 0zDEADBEEF
      call insert(b, 0x33, 2)
      call assert_equal(0zDEAD33BEEF, b)
  END
  call CheckLegacyAndVim9Success(lines)

  " only works in legacy script
  call assert_equal(0, insert(test_null_blob(), 0x33))

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call insert(b, -1)
  END
  call CheckLegacyAndVim9Failure(lines, 'E475:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call insert(b, 257)
  END
  call CheckLegacyAndVim9Failure(lines, 'E475:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call insert(b, 0, [9])
  END
  call CheckLegacyAndVim9Failure(lines, ['E745:', 'E1013:', 'E745:'])

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call insert(b, 0, -20)
  END
  call CheckLegacyAndVim9Failure(lines, 'E475:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call insert(b, 0, 20)
  END
  call CheckLegacyAndVim9Failure(lines, 'E475:')

  let lines =<< trim END
      VAR b = 0zDEADBEEF
      call insert(b, [])
  END
  call CheckLegacyAndVim9Failure(lines, ['E745:', 'E1013:', 'E745:'])

  let lines =<< trim END
      insert(test_null_blob(), 0x33)
  END
  call CheckDefExecAndScriptFailure(lines, 'E1131:')
endfunc

func Test_blob_reverse()
  let lines =<< trim END
      call assert_equal(0zEFBEADDE, reverse(0zDEADBEEF))
      call assert_equal(0zBEADDE, reverse(0zDEADBE))
      call assert_equal(0zADDE, reverse(0zDEAD))
      call assert_equal(0zDE, reverse(0zDE))
      call assert_equal(0z, reverse(test_null_blob()))
  END
  call CheckLegacyAndVim9Success(lines)
endfunc

func Test_blob_json_encode()
  let lines =<< trim END
      call assert_equal('[222,173,190,239]', json_encode(0zDEADBEEF))
      call assert_equal('[]', json_encode(0z))
  END
  call CheckLegacyAndVim9Success(lines)
endfunc

func Test_blob_lock()
  let lines =<< trim END
      let b = 0z112233
      lockvar b
      unlockvar b
      let b = 0z44
  END
  call CheckScriptSuccess(lines)

  let lines =<< trim END
      vim9script
      var b = 0z112233
      lockvar b
      unlockvar b
      b = 0z44
  END
  call CheckScriptSuccess(lines)

  let lines =<< trim END
      let b = 0z112233
      lockvar b
      let b = 0z44
  END
  call CheckScriptFailure(lines, 'E741:')

  let lines =<< trim END
      vim9script
      var b = 0z112233
      lockvar b
      b = 0z44
  END
  call CheckScriptFailure(lines, 'E741:')
endfunc

func Test_blob_sort()
  if has('float')
    call CheckLegacyAndVim9Failure(['call sort([1.0, 0z11], "f")'], 'E975:')
  endif
  call CheckLegacyAndVim9Failure(['call sort([11, 0z11], "N")'], 'E974:')
endfunc

" vim: shiftwidth=2 sts=2 expandtab
