<?php

namespace Application\Common\Models;

class Roles extends ModelBase
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
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("test");
        $this->setSource("roles");
        $this->hasMany('id', 'Application\Common\Models\PermissionRole', 'role_id', ['alias' => 'PermissionRole']);
        $this->hasMany('id', 'Application\Common\Models\RoleAdmin', 'role_id', ['alias' => 'RoleAdmin']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'roles';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Roles[]|Roles|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Roles|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public static function roleCount($where){
        return parent::count($where);
    }


    public static function roleList($filed,$where = array(),$offset = null ,$limit = null ){
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
