<?php

namespace Application\Common\Models;

use Phalcon\Validation;
use Phalcon\Validation\Validator\PresenceOf;
use Phalcon\Validation\Validator\StringLength;
use Phalcon\Validation\Validator\Uniqueness;

class Permissions extends ModelBase
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(column="id", type="integer", length=10, nullable=false)
     */
    public $id;

    /**
     *
     * @var string
     * @Column(column="name", type="string", length=255, nullable=false)
     */
    public $name;

    /**
     *
     * @var string
     * @Column(column="display_name", type="string", length=255, nullable=true)
     */
    public $display_name;

    /**
     *
     * @var string
     * @Column(column="description", type="string", length=255, nullable=true)
     */
    public $description;

    /**
     *
     * @var string
     * @Column(column="created_at", type="string", nullable=true)
     */
    public $created_at;

    /**
     *
     * @var string
     * @Column(column="updated_at", type="string", nullable=true)
     */
    public $updated_at;

    /**
     *
     * @var string
     * @Column(column="section", type="string", length=255, nullable=false)
     */
    public $section;

    /**
     *
     * @var string
     * @Column(column="flag", type="string", length=255, nullable=false)
     */
    public $flag;

    /**
     *
     * @var string
     * @Column(column="mode", type="string", length=255, nullable=false)
     */
    public $mode;

    /**
     *
     * @var integer
     * @Column(column="show", type="integer", length=4, nullable=false)
     */
    public $show;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("test");
        $this->setSource("permissions");
        $this->hasMany('id', 'Application\Common\Models\PermissionRole', 'permission_id', ['alias' => 'PermissionRole']);
    }

    public function validation()
    {
        $validator = new Validation();
        $validator->add('name',new PresenceOf(['model'=>$this,'message'=>'请填写权限名称！']));
        $validator->add('name',new Uniqueness(['model'=>$this,'message'=>'该权限已经存在！']));
        $validator->add('name',new StringLength(['model'=>$this,'min' => 2,'messageMinimum'=>'名称长度大于2']));
        return $this->validate($validator);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'permissions';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Permissions[]|Permissions|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Permissions|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public static function permissionCount($where){
        return parent::count($where);
    }

    public static function permissionList($filed = '* ',$where = array(),$offset = null,$limit = null){
        $parameters = array();
        if($where){
            $parameters[] = self::whereFormat($where);
        }
        if($offset != null){
            $parameters['offset'] = $offset;
        }
        if($limit != null){
            $parameters['limit'] = $limit;
        }
        return parent::find($parameters)->toArray();
    }
}
