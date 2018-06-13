;; emacs-helm-inserter.el --- 
;;
;; Author:  <raisatu@sabayon.local>
;; Version: 0.1
;; URL: 
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;; .
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'helm)

(defgroup emacs-helm-inserter nil
  "A group for `emacs-helm-inserter'."
  :group 'helm)

(defcustom emacs-helm-inserter-candidates '(("create" . "造"))
  "Candidates for helm source. It's should be an alist of strings, where
each key is a name that will be displayed in helm buffer, and
each value is a value that will be inserted at the point."
  :group 'emacs-helm-inserter
  :type '(repeat (cons string string)))

(defun emacs-helm-inserter ()
  "Run helm inserter."
  (interactive)
  (let* ((candidates emacs-helm-inserter-candidates)
         (source `((name . "Emacs helm inserter")
                   (candidates . ,(mapcar #'first candidates))
                   (action . (lambda (candidate)
                               (insert (cdr (assoc candidate
                                                   ',candidates))))))))
    (helm :sources '(source))))

(provide 'emacs-helm-inserter)
;;; emacs-helm-inserter.el ends here
